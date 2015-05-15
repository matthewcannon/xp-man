class Test
    @total = 0
    @failed = 0

    def self.run_all (tests)
        tests.each do |test|
            run_test test
        end
    end

    def self.run_test(&block)
        block.call
    end

    def self.assertEquals (expected, actual)
        @total = @total + 1
        if (expected != actual)
            @failed = @failed + 1
            puts "expected #{expected} actual #{actual} : Failed!"
        else
            puts "expected #{expected} actual #{actual} : Passed!"
        end
    end

    def self.summary
        puts "Total tests #{@total}, #{@failed} failed"
    end
end


class Cart
    def self.scan item_code
        10
    end

    def self.total
        20
    end
end


class ShoppingTests
    # 'scanning one a costs 10'
    def self.test1
        y = Cart.scan 'a'
        Test.assertEquals 10, y
    end

    # 'scanning two a's costs 20'
    def self.test2
        #arrange
        #act
        Cart.scan 'a'
        Cart.scan 'a'
        #assert
        Test.assertEquals 20, Cart.total
    end
end

tests = []
tests[0] = ShoppingTests.test1
tests[1] = ShoppingTests.test2
Test.run_all tests
Test.summary
