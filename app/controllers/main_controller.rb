class MainController < UIViewController

  def viewDidLoad
    super
    # self.edgesForExtendedLayout = UIRectEdgeNone
    rmq.stylesheet = MainStylesheet
    init_nav
    rmq(self.view).apply_style :root_view

    # Create your UIViews here
    @hello_world_label = rmq.append!(UILabel, :hello_world)
  end

  def init_nav
    self.title = 'Title Here'

    self.navigationItem.tap do |nav|
      nav.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(
        UIBarButtonSystemItemRefresh, target: self, action: :nav_right_button)
    end
  end

  def nav_right_button
    controller = NotificationsController.new
    @popover_controller = WYPopoverController.alloc.initWithContentViewController(controller)
    @popover_controller.delegate = self
    @popover_controller.popoverLayoutMargins = UIEdgeInsetsMake(0, 0, 0, 0)

    size = @popover_controller.popoverContentSize
    @popover_controller.setPopoverContentSize(CGSizeMake(rmq.device.width, size.height))

    @popover_controller.presentPopoverFromBarButtonItem(
      self.navigationItem.rightBarButtonItem,
      permittedArrowDirections: WYPopoverArrowDirectionUp,
      animated: true,
      options: WYPopoverAnimationOptionScale
    )
  end

end
