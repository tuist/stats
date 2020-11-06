import { ApolloClient, InMemoryCache } from "@apollo/client";
import { ApolloLink } from "apollo-link";
import { createHttpLink } from "apollo-link-http";
import ActionCable from "actioncable";
import { ActionCableLink } from "graphql-ruby-client";

const cable = ActionCable.createConsumer();

const httpLink = createHttpLink({ uri: "/graphql" });
const middlewareLink = new ApolloLink((operation, forward) => {
  const csrfToken = document
    .querySelector("meta[name=csrf-token]")
    .getAttribute("content");
  operation.setContext({
    credentials: "same-origin",
    headers: { "X-CSRF-Token": csrfToken },
  });
  return forward(operation);
});

const hasSubscriptionOperation = ({ query: { definitions } }) => {
  return definitions.some(
    ({ kind, operation }) =>
      kind === "OperationDefinition" && operation === "subscription"
  );
};

const link = ApolloLink.split(
  hasSubscriptionOperation,
  middlewareLink.concat(new ActionCableLink({ cable })),
  middlewareLink.concat(httpLink)
);

const client = new ApolloClient({
  link: link as any,
  uri: API_URL, // Defined in the Webpack configuration.
  cache: new InMemoryCache(),
});

export default client;
