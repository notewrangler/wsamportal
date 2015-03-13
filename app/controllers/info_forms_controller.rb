class InfoFormsController < ApplicationController

	def new_hire

		send_file("wsamportal/public/WSM_Code_of_Conduct.pdf", :type => "application/pdf", :filename => "WSM_Code_of_Conduct.pdf", 
			:disposition => 'attachment', :status => '200 OK', :streaming => 'true')


		redirect_to info_files_path 
	end


	
end
