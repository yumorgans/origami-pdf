require 'test/unit'

  class TC_PdfNew < Test::Unit::TestCase

    #def setup
    #end

    # def teardown
    # end

    def test_pdf_struct

      pdf = PDF.new

      null = Null.new
      assert_nothing_raised do
        pdf << null
      end

      assert_nothing_raised do
        pdf.saveas("/dev/null")
      end

      assert null.is_indirect?
      assert pdf.objects.include?(null)
      assert_equal pdf.revisions.first.body[null.reference], null
      assert_equal null.reference.solve, null
    end

end