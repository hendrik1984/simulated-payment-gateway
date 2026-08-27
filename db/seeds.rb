# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
PaymentMethod.find_or_create_by!(code: "vr001") do |payment_method|
  payment_method.name = "Virtual Account BCA"
end

PaymentMethod.find_or_create_by!(code: "vr002") do |payment_method|
  payment_method.name = "Virtual Account Mandiri"
end

PaymentMethod.find_or_create_by!(code: "vr003") do |payment_method|
  payment_method.name = "Virtual Account BNI"
end

PaymentMethod.find_or_create_by!(code: "bk001") do |payment_method|
  payment_method.name = "Bank Transfer BCA"
end

PaymentMethod.find_or_create_by!(code: "bk002") do |payment_method|
  payment_method.name = "Bank Transfer Mandiri"
end

PaymentMethod.find_or_create_by!(code: "bk003") do |payment_method|
  payment_method.name = "Bank Transfer BNI"
end

PaymentMethod.find_or_create_by!(code: "ew001") do |payment_method|
  payment_method.name = "E-Wallet OVO"
end

PaymentMethod.find_or_create_by!(code: "ew002") do |payment_method|
  payment_method.name = "E-Wallet GOPAY"
end

PaymentMethod.find_or_create_by!(code: "ew003") do |payment_method|
  payment_method.name = "E-Wallet SHOPEE PAY"
end

PaymentMethod.find_or_create_by!(code: "qr001") do |payment_method|
  payment_method.name = "QR Payment BCA"
end

PaymentMethod.find_or_create_by!(code: "qr002") do |payment_method|
  payment_method.name = "QR Payment Mandiri"
end

PaymentMethod.find_or_create_by!(code: "qr003") do |payment_method|
  payment_method.name = "QR Payment BNI"
end
