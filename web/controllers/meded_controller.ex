defmodule Callme.MededController do
  use Callme.Web, :controller

  def index(conn, _params) do
  	videos = Repo.all(Callme.Video)
  	topics = Repo.all(from p in Callme.Video, where: p.topic > "", distinct: p.topic)
    render conn, "index.html", videos: videos, topics: topics
  end
  def bytopic(conn, _params) do
    topic = _params["topic"]
  	videos = Repo.all(from p in Callme.Video, where: p.topic == ^topic)
  	topics = Repo.all(from p in Callme.Video, where: p.topic > "", distinct: p.topic)
  	render conn, "topic.html", videos: videos, topics: topics
  end
end