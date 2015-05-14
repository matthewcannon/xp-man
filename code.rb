class Test
    @total = 0
    @failed = 0

    def self.execute(&block)
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

x = Test.execute do
    2
end

Test.assertEquals 1, x
Test.assertEquals 1, x

y = Test.execute do
    1 + 1
end

Test.assertEquals 2, y
Test.summary

class Cart
    def self.scan item_code
        10
    end

    def self.total
        20
    end
end


class MyTest
    # 'scanning one a costs 10'
    def self.run
        y = Test.execute do
            Cart.scan 'a'
        end
        Test.assertEquals 10, y
    end

    # 'scanning two a's costs 20'
    def self.run
        y = Test.execute do
            Cart.scan 'a'
            Cart.scan 'a'
            Cart.total
        end
        Test.assertEquals 20, y
    end
end

MyTest.run
