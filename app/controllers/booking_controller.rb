class BookingController < ApplicationController
  def index
  end

  def new
  end

  def show
    @bookings = Booking.order(created_at: :desc)
  end

  def download_as_csv
    @bookings = Booking.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.csv { send_data @bookings.to_csv, filename: "bookings-#{Date.today}.csv" }
    end
  end

  def invoice_pdf
    invoice = Booking.find(params[:id])
    InvoicePdf.new(invoice)
  end

  def send_invoice_pdf
    send_file invoice_pdf.to_pdf,
              filename: invoice_pdf.filename,
              type: "application/pdf",
              disposition: "inline"
  end
end
