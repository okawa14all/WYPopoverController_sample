class AppDelegate
  attr_reader :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    main_controller = MainController.new
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(main_controller)

    popover_appearance = WYPopoverBackgroundView.appearance
    popover_appearance.setFillTopColor(rmq.color.white)

    @window.makeKeyAndVisible
    true
  end

end
