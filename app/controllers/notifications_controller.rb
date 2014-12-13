class NotificationsController < UIViewController

  def viewDidLoad
    super
    rmq.stylesheet = NotificationsControllerStylesheet
    rmq(self.view).apply_style :root_view

    # Create your views here
    @hoge = rmq.append!(UILabel, :hoge)
  end
end
