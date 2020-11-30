require "render_anywhere"

class InvoicePdf
  include RenderAnywhere

  def initialize(invoice)
    @invoice = invoice
  end

  def to_pdf
    kit = PDFKit.new(pdf_html, page_size: 'A4')
    kit.to_file("#{Rails.root}/public/invoice.pdf")
  end

  def filename
    "Invoice_#{invoice.id}.pdf"
  end

  private

  attr_reader :invoice

  def pdf_html
    ActionController::Base.new.render_to_string(template: "invoices/pdf", layout: "invoice_pdf", locals: { invoice: invoice })
  end
end
