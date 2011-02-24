typedef enum {
	kLineShape = 0,
	kRectShape,
	kEclipseShape,
	kImageShape
} ShapeType;

typedef enum {
	kRedColorTab = 0,
	kBlueColorTab,
	kYellowColorTab,
	kGreenColorTab,
	kRandomColorTab
} ColorTabIndex;

#define degreesToRadian(x) (M_PI * (x) / 180.0)