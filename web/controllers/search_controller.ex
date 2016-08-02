defmodule Callme.SearchController do
  use Callme.Web, :controller

  def zipsearch(conn, _params) do
  	userzip = _params["searchzip"]
  	
  	zip = Repo.get_by(Callme.Zipcode, zip: userzip["searchzip"] )
  	servicesstate = Repo.all(from p in Callme.Service, where: ilike(p.locations, ^"%#{zip.state}%") or ilike(p.locations, ^zip.county))
  	servicespecialties = Repo.all(from p in Callme.Service, where: ilike(p.locations, ^"%#{zip.state}%") or ilike(p.locations, ^zip.county), where: p.specialty > "", distinct: p.specialty)
  	servicetypes = Repo.all(from p in Callme.Service, where: ilike(p.locations, ^"%#{zip.state}%") or ilike(p.locations, ^zip.county), where: p.type > "", distinct: p.type)
  	render conn, "zipsearch.html", userzip: userzip, zip: zip, servicesstate: servicesstate, servicespecialties: servicespecialties, servicetypes: servicetypes
  end
  def serviceshow(conn, _params) do
  	doctor = Repo.get_by(Callme.Doctor, id: _params["doctor_id"])
  	service = Repo.get_by(Callme.Service, id: _params["service_id"])
  	render conn, "serviceshow.html", doctor: doctor, service: service
  end
  def refinesearch(conn, _params) do
  	servicetype = _params["servicetype"]
  	specialty = _params["specialty"]
    userzip = _params["zip"]
    zip = Repo.get_by(Callme.Zipcode, zip: _params["zip"] )
    if servicetype == "all" && specialty == "all" do
        servicesshown = Repo.all(from p in Callme.Service, where: ilike(p.locations, ^"%#{zip.state}%") or ilike(p.locations, ^zip.county))
        else 
        	if servicetype != "all" && specialty == "all" do
        		servicesshown = Repo.all(from p in Callme.Service, where: ilike(p.type, ^servicetype), where: ilike(p.locations, ^"%#{zip.state}%") or ilike(p.locations, ^zip.county))
        	else
        		if servicetype == "all" && specialty != "all" do
        			servicesshown = Repo.all(from p in Callme.Service, where: ilike(p.specialty, ^specialty), where: ilike(p.locations, ^"%#{zip.state}%") or ilike(p.locations, ^zip.county))
        		else 
        			servicesshown = Repo.all(from p in Callme.Service, where: ilike(p.specialty, ^specialty), where: ilike(p.type, ^servicetype), where: ilike(p.locations, ^"%#{zip.state}%") or ilike(p.locations, ^zip.county))
        		end
        	end
        end
  render conn, "refinesearch.html", servicetype: servicetype, specialty: specialty, zip: userzip, servicesshown: servicesshown
end
end