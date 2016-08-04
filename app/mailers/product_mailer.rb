class ProductMailer < ApplicationMailer
	def critical_quantities(productos)
		@products = productos

		User.all.admins.each do |user|
			mail(to: user.email, subject: "Informe de Productos Críticos")
		end
	end
end