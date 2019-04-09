
require './config/environment'

#if ActiveRecord::Migrator.needs_migration?
 # raise 'Migrations are pending. Run 'rake db:migrate' to fix'
#end 

use Rack::MethodOverride
use Rack::Static, :root => 'public', :urls => ['/images', '/stylesheets']

use RepresentativesController
use CustomersController
run ApplicationController
