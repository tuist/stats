require 'test_helper'

# TODO: to run these tests associate the db test_stats

# class CommandEventsControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @command_event = command_events(:one)
#   end

#   test "should get index" do
#     get command_events_url
#     assert_response :success
#   end

#   test "should get new" do
#     get new_command_event_url
#     assert_response :success
#   end

#   test "should create command_event" do
#     assert_difference('CommandEvent.count') do
#       post command_events_url, params: { command_event: { client_id: @command_event.client_id, duration: @command_event.duration, macos_version: @command_event.macos_version, name: @command_event.name, params: @command_event.params, subcommand: @command_event.subcommand, swift_version: @command_event.swift_version, tuist_version: @command_event.tuist_version } }
#     end

#     assert_redirected_to command_event_url(CommandEvent.last)
#   end

#   test "should show command_event" do
#     get command_event_url(@command_event)
#     assert_response :success
#   end

#   test "should get edit" do
#     get edit_command_event_url(@command_event)
#     assert_response :success
#   end

#   test "should update command_event" do
#     patch command_event_url(@command_event), params: { command_event: { client_id: @command_event.client_id, duration: @command_event.duration, macos_version: @command_event.macos_version, name: @command_event.name, params: @command_event.params, subcommand: @command_event.subcommand, swift_version: @command_event.swift_version, tuist_version: @command_event.tuist_version } }
#     assert_redirected_to command_event_url(@command_event)
#   end

#   test "should destroy command_event" do
#     assert_difference('CommandEvent.count', -1) do
#       delete command_event_url(@command_event)
#     end

#     assert_redirected_to command_events_url
#   end
# end
