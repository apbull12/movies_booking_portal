class BookingController < ApplicationController

  def show
    @bookings = Booking.order(created_at: :desc)
  end

  def download_as_csv
    @bookings = Booking.order(created_at: :desc)

    respond_to do |format|
      if @bookings.present?
        format.html
        format.csv { send_data @bookings.to_csv, filename: "bookings-#{Date.today}.csv" }
      else
        format.html { redirect_to @bookings, notice: 'No records to export!!' }
      end
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
