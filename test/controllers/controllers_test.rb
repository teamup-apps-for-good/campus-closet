# frozen_string_literal: true

require 'test_helper'
# this module sets up test for all the controllers - currently type, status, gender, size, condition
module CommonControllerTests
  extend ActiveSupport::Concern

  included do
    setup do
      @resource = send("#{resource_name}s", :one)
    end

    test 'should get index' do
      get send("#{resource_name}s_url")
      assert_response :success
    end

    test 'should get new' do
      get send("new_#{resource_name}_url")
      assert_response :success
    end

    test 'should create resource' do
      assert_difference("#{resource_name.camelize}.count") do
        post send("#{resource_name}s_url"), params: { resource_name.to_s => { name: @resource.name } }
      end

      assert_redirected_to send("#{resource_name}_url", resource_name.camelize.to_s.constantize.last)
    end
  end

  included do
    setup do
      @resource = send("#{resource_name}s", :one)
    end

    test 'should show resource' do
      get send("#{resource_name}_url", @resource)
      assert_response :success
    end

    test 'should get edit' do
      get send("edit_#{resource_name}_url", @resource)
      assert_response :success
    end

    test 'should update resource' do
      patch send("#{resource_name}_url", @resource), params: { resource_name.to_s => { name: @resource.name } }
      assert_redirected_to send("#{resource_name}_url", @resource)
    end

    test 'should destroy resource' do
      assert_difference("#{resource_name.camelize}.count", -1) do
        delete send("#{resource_name}_url", @resource)
      end

      assert_redirected_to send("#{resource_name}s_url")
    end
  end
end

# controller for types of clothing - pants, shirts, etc
class TypesControllerTest < ActionDispatch::IntegrationTest
  include CommonControllerTests

  self.resource_name = 'type'
end

# controller for status of clothing - available or unavailable
class StatusesControllerTest < ActionDispatch::IntegrationTest
  include CommonControllerTests

  self.resource_name = 'status'
end

# controller for gender of clothing - Male, Female, Unisex
class GendersControllerTest < ActionDispatch::IntegrationTest
  include CommonControllerTests

  self.resource_name = 'gender'
end

# controller for size of clothing - S, M, L
class SizesControllerTest < ActionDispatch::IntegrationTest
  include CommonControllerTests

  self.resource_name = 'size'
end

# controller for types of clothing - Used or Unused
class ConditionControllerTest < ActionDispatch::IntegrationTest
  include CommonControllerTests

  self.resource_name = 'condition'
end

# controller for the users
class UserControllerTest < ActionDispatch::IntegrationTest
  include CommonControllerTests

  self.resource_name = 'user'
end
