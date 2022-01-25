require 'test/unit'
require_relative '../countries/CH'

class TestCountry < Test::Unit::TestCase 

    def setup
        @ch = CH.new
    end
    def test_lines
       ## assert_not_nil(@ch.lines)
    end
    def test_trains
        assert_not_nil(@ch.trains)
    end
    def test_schedules 
        assert_not_nil(@ch.schedules)
    end
    def test_events
        assert_not_nil(@ch.events)
    end
    def test_trainsonlines
        assert_not_nil(@ch.trainsonlines)
    end
    def test_structure
        assert_not_nil(@ch.structure)
    end
    def teardown
        @ch = nil
    end
end