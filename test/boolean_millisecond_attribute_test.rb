require File.dirname(__FILE__) + '/test_helper'

class BooleanMillisecondAttributeTest < Test::Unit::TestCase
  context BooleanMillisecondAttribute do
    setup do
      @resource = Resource.new
    end

    should 'define the methods' do
      assert @resource.respond_to?(:deleted_at)
      assert @resource.respond_to?(:deleted)
      assert @resource.respond_to?(:deleted?)
      assert @resource.respond_to?(:deleted!)
      assert @resource.respond_to?(:deleted=)
    end

    should 'initialize a resource with a deleted_at column with value false' do
      resource = Resource.new
      assert_equal false, resource.deleted
      assert_equal false, resource.deleted?
    end

    should 'return true after deleted! is called' do
      @resource.deleted!
      assert_equal true, @resource.deleted
      assert_equal true, @resource.deleted?
      assert_instance_of(Fixnum, @resource.deleted_at)
    end

    should 'return true after deleted=true is called' do
      @resource.deleted = true
      assert_equal true, @resource.deleted
      assert_equal true, @resource.deleted?
      assert_instance_of(Fixnum, @resource.deleted_at)
    end

    should 'return true after deleted=\'true\' is called' do
      @resource.deleted = 'true'
      assert_equal true, @resource.deleted
      assert_equal true, @resource.deleted?
      assert_instance_of(Fixnum, @resource.deleted_at)
    end

    should 'return true after deleted=1 is called' do
      @resource.deleted = 1
      assert_equal true, @resource.deleted
      assert_equal true, @resource.deleted?
      assert_instance_of(Fixnum, @resource.deleted_at)
    end

    should 'return true after deleted=\'1\' is called' do
      @resource.deleted = '1'
      assert_equal true, @resource.deleted
      assert_equal true, @resource.deleted?
      assert_instance_of(Fixnum, @resource.deleted_at)
      assert_instance_of(Time, @resource.deleted_at_datetime)
    end

    should 'set deleted to false and return false after deleted= false is called' do
      @resource.deleted = true
      @resource.deleted = false
      assert_equal false, @resource.deleted
      assert_equal false, @resource.deleted?
    end

    should 'return nil when deleted_at is called, after deleted= false is called' do
      @resource.deleted = true
      @resource.deleted = false
      assert_equal nil, @resource.deleted_at
    end

    should 'set deleted to false and return false after deleted= 0 is called' do
      @resource.deleted = true
      @resource.deleted = 0
      assert_equal false, @resource.deleted
      assert_equal false, @resource.deleted?
    end

    should 'return nil when deleted_at is called, after deleted= 0 is called' do
      @resource.deleted = true
      @resource.deleted = 0
      assert_equal nil, @resource.deleted_at
    end

    teardown do
      Resource.delete_all
    end
  end
end
