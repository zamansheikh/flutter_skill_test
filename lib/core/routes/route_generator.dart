import 'package:flutter/material.dart';
import 'package:flutter_skill_test/core/routes/route_names.dart';
import 'package:flutter_skill_test/features/home/domain/entities/house.dart';
import 'package:flutter_skill_test/features/home/presentation/pages/home_page.dart';
import 'package:flutter_skill_test/features/home/presentation/pages/home_screen.dart';
import 'package:flutter_skill_test/features/home/presentation/pages/house_detail_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case RouteNames.houseDetails:
        return MaterialPageRoute(
            builder: (_) =>
                HouseDetailPage(house: settings.arguments as House));

      default:
        return MaterialPageRoute(builder: (_) => Error404Screen());
    }
  }
}

class Error404Screen extends StatelessWidget {
  const Error404Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.string(
                    error404Illistration,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const Spacer(flex: 2),
              ErrorInfo(
                title: "Lost in Space!",
                description:
                    "The page you are looking for seems to be missing. Please go back or visit the homepage.",
                // button: you can pass your custom button,
                btnText: "Back to home",
                press: () async {
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorInfo extends StatelessWidget {
  const ErrorInfo({
    super.key,
    required this.title,
    required this.description,
    this.button,
    this.btnText,
    required this.press,
  });

  final String title;
  final String description;
  final Widget? button;
  final String? btnText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16 * 2.5),
            button ??
                ElevatedButton(
                  onPressed: press,
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  child: Text(btnText ?? "Retry".toUpperCase()),
                ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

const error404Illistration = '''
<svg width="1080" height="1080" viewBox="0 0 1080 1080" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M541.25 279.47C578.25 249.12 667.8 262.99 691.7 308.91C712.54 343 711.93 403.16 670.77 446.27C639.83 475.71 657.51 514.97 644.31 576.87C619.44 682.87 466.85 645.71 483.2 545.35C489 486.52 521.03 442.86 510.2 407.15C492.36 349.79 514.08 300.51 541.25 279.47Z" fill="#D3D3D3"/>
<path d="M514.4 279.47C551.4 249.12 641 263 664.85 308.9C685.69 342.99 685.08 403.15 643.92 446.26C613 475.71 630.66 515 617.46 576.86C592.59 682.86 440 645.7 456.35 545.34C462.15 486.51 494.18 442.85 483.35 407.14C465.51 349.79 487.23 300.51 514.4 279.47Z" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M622.45 512.9C637.407 531.813 646.211 554.854 647.677 578.922C649.143 602.99 643.2 626.929 630.649 647.517C618.098 668.106 599.541 684.355 577.476 694.077C555.41 703.8 530.896 706.53 507.232 701.899C483.569 697.268 461.892 685.499 445.12 668.175C428.347 650.852 417.284 628.806 413.42 605.006C409.556 581.205 413.076 556.791 423.507 535.052C433.937 513.312 450.777 495.289 471.76 483.41" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M624.519 491.348L477.978 462.678C475.181 462.131 472.47 463.954 471.923 466.751L469.771 477.752C469.223 480.549 471.047 483.26 473.844 483.807L620.385 512.478C623.182 513.025 625.893 511.201 626.44 508.405L628.593 497.403C629.14 494.606 627.316 491.896 624.519 491.348Z" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M599.21 615.7L619.65 656.83L571.9 634.43C582.3 629.76 593 621.15 599.21 615.7Z" fill="#ABABAB"/>
<path d="M598.39 615.21L619.46 654.71C619.704 655.185 619.792 655.725 619.712 656.253C619.631 656.781 619.387 657.27 619.013 657.651C618.638 658.032 618.153 658.285 617.627 658.375C617.101 658.464 616.559 658.386 616.08 658.15L567.42 636.24" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10"/>
<path d="M574.78 632.79L619.03 653.7" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10"/>
<path d="M460.41 588.54L426.23 617.61L478.64 616.18C470.78 607.94 464.09 595.93 460.41 588.54Z" fill="#ABABAB"/>
<path d="M460.8 588.29L426.39 616.94C425.981 617.287 425.693 617.754 425.566 618.275C425.439 618.796 425.48 619.343 425.683 619.839C425.886 620.335 426.241 620.754 426.696 621.037C427.152 621.319 427.685 621.449 428.22 621.41L482.22 619.03" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10"/>
<path d="M476.6 613.58L427.73 616.26" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10"/>
<path d="M584.07 400.95L536.81 345.46C531.87 338.76 537.09 325.77 543.81 320.83C550.51 315.89 567.08 315.48 572.01 322.18L608.42 383C610.789 386.233 611.782 390.272 611.182 394.235C610.583 398.198 608.439 401.762 605.22 404.15V404.15C601.987 406.519 597.948 407.512 593.985 406.912C590.022 406.313 586.458 404.169 584.07 400.95V400.95Z" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10"/>
<path d="M587.418 364.272L572.854 343.681C569.625 339.116 563.307 338.033 558.742 341.262L558.734 341.268C554.169 344.497 553.086 350.815 556.315 355.38L570.879 375.97C574.107 380.535 580.426 381.618 584.991 378.389L584.999 378.384C589.564 375.155 590.647 368.837 587.418 364.272Z" fill="#0E0E0E"/>
<path d="M604.657 383.151L600.601 381.421C599.483 380.944 598.191 381.464 597.714 382.581L597.71 382.59C597.233 383.708 597.753 385 598.871 385.477L602.927 387.207C604.045 387.684 605.337 387.165 605.814 386.047L605.818 386.038C606.294 384.92 605.775 383.628 604.657 383.151Z" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10"/>
<path d="M585.411 392.28L585.137 396.681C585.062 397.894 585.984 398.938 587.197 399.014L587.207 399.014C588.42 399.089 589.464 398.167 589.539 396.955L589.812 392.553C589.887 391.34 588.965 390.296 587.752 390.221L587.742 390.22C586.53 390.145 585.486 391.067 585.411 392.28Z" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10"/>
<path d="M596.671 395.87C597.357 396.839 598.699 397.068 599.668 396.381C600.637 395.695 600.866 394.353 600.179 393.384L597.693 389.876C597.007 388.907 595.665 388.678 594.696 389.364C593.727 390.051 593.498 391.393 594.185 392.362L596.671 395.87Z" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10"/>
<path d="M672.85 326.27C678.64 324.14 685.03 323.62 688.77 326.27L742.61 372.39C745.882 374.704 748.106 378.218 748.795 382.166C749.485 386.114 748.584 390.174 746.29 393.46V393.46C743.976 396.732 740.462 398.956 736.514 399.645C732.566 400.335 728.506 399.434 725.22 397.14L678.11 368.74" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10"/>
<path d="M714.424 359.026L694.198 344.146C689.714 340.847 683.404 341.808 680.105 346.293L680.099 346.301C676.8 350.785 677.761 357.095 682.246 360.394L702.472 375.273C706.956 378.572 713.266 377.611 716.565 373.127L716.571 373.119C719.87 368.634 718.909 362.325 714.424 359.026Z" fill="#0E0E0E"/>
<path d="M739.137 373.64L734.741 373.286C733.53 373.189 732.469 374.092 732.372 375.303L732.371 375.313C732.274 376.524 733.177 377.585 734.388 377.682L738.783 378.036C739.995 378.133 741.055 377.23 741.153 376.019L741.154 376.009C741.251 374.798 740.348 373.737 739.137 373.64Z" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10"/>
<path d="M723.686 384.871L724.833 389.149C725.148 390.327 726.36 391.027 727.539 390.711L727.548 390.708C728.727 390.392 729.426 389.181 729.11 388.002L727.964 383.724C727.648 382.546 726.436 381.847 725.258 382.163L725.248 382.165C724.069 382.481 723.37 383.693 723.686 384.871Z" stroke="#0E0E0E" stroke-width="3.01272" stroke-miterlimit="10"/>
<path d="M735.54 388.252C736.498 388.954 737.843 388.745 738.544 387.787C739.245 386.828 739.037 385.483 738.079 384.782L734.608 382.243C733.65 381.542 732.305 381.75 731.603 382.709C730.902 383.667 731.111 385.012 732.069 385.713L735.54 388.252Z" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10"/>
<path d="M603.7 577.59C611.919 579.811 619.883 582.888 627.46 586.77" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M567 573.27C570.273 573.203 573.49 573.247 576.65 573.4" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M606.77 567C618.575 568.778 630.06 572.254 640.87 577.32" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M568.33 567.19C570.75 566.83 573.143 566.533 575.51 566.3" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M607.06 554.69C619.654 554.65 632.18 556.525 644.21 560.25" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M569.06 560.76C570.987 560.16 572.903 559.607 574.81 559.1" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M471.32 551.63C462.638 550.509 453.861 550.328 445.14 551.09" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M506.21 561.37C503.437 560.177 500.673 559.087 497.92 558.1" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M469.15 540C458.368 537.648 447.321 536.743 436.3 537.31" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M507.3 555.25C504.987 553.877 502.653 552.587 500.3 551.38" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M470.17 526.79C457.974 522.552 445.205 520.192 432.3 519.79" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M509.14 548.76C506.58 546.673 503.993 544.717 501.38 542.89" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M484.23 488.81C472.01 509.48 466.3 530.81 471.65 553.08C476.56 568.59 491.79 566.94 497.5 558.14C506.15 546.09 495.98 516.73 509.44 497.14" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10" stroke-linecap="round"/>
<path d="M589.68 509.44C577.46 530.11 571.75 551.44 577.1 573.71C582.01 589.22 597.24 587.57 602.95 578.77C611.6 566.72 601.43 537.36 614.89 517.77" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10" stroke-linecap="round"/>
<path d="M575.439 609.419C577.102 600.92 571.56 592.683 563.061 591.02C554.563 589.357 546.325 594.899 544.663 603.398C543 611.896 548.541 620.134 557.04 621.797C565.539 623.459 573.776 617.918 575.439 609.419Z" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10"/>
<path d="M571.111 608.572C572.306 602.464 568.323 596.543 562.215 595.348C556.106 594.153 550.186 598.136 548.99 604.244C547.795 610.353 551.778 616.273 557.887 617.468C563.995 618.664 569.916 614.681 571.111 608.572Z" fill="#231F20"/>
<path d="M542.42 579.94L533.27 586.1C533.114 586.207 532.937 586.282 532.752 586.32C532.566 586.359 532.374 586.36 532.188 586.324C532.002 586.287 531.825 586.214 531.668 586.109C531.51 586.004 531.375 585.868 531.27 585.71L525.11 576.56C525.003 576.404 524.928 576.227 524.89 576.042C524.851 575.856 524.85 575.664 524.886 575.478C524.923 575.292 524.996 575.115 525.101 574.958C525.206 574.8 525.342 574.665 525.5 574.56L542.8 577.94C542.908 578.096 542.983 578.272 543.022 578.457C543.061 578.642 543.063 578.833 543.028 579.019C542.993 579.206 542.921 579.383 542.816 579.541C542.712 579.699 542.577 579.834 542.42 579.94Z" fill="#231F20"/>
<path d="M550.77 545.79L539.39 549.54L530.69 539.96" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M566.239 613.545C566.519 612.114 565.586 610.727 564.155 610.447C562.725 610.167 561.338 611.1 561.058 612.531C560.778 613.962 561.711 615.349 563.142 615.629C564.573 615.909 565.96 614.976 566.239 613.545Z" fill="white"/>
<path d="M514.267 597.452C515.929 588.954 510.388 580.716 501.889 579.053C493.39 577.391 485.153 582.932 483.49 591.431C481.827 599.93 487.369 608.167 495.868 609.83C504.366 611.493 512.604 605.951 514.267 597.452Z" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10"/>
<path d="M509.939 596.606C511.134 590.497 507.151 584.577 501.042 583.381C494.934 582.186 489.013 586.169 487.818 592.278C486.623 598.386 490.606 604.307 496.714 605.502C502.823 606.697 508.743 602.714 509.939 596.606Z" fill="#231F20"/>
<path d="M505.067 601.579C505.347 600.148 504.414 598.761 502.983 598.481C501.552 598.201 500.165 599.134 499.885 600.565C499.605 601.996 500.538 603.383 501.969 603.663C503.4 603.943 504.787 603.01 505.067 601.579Z" fill="white"/>
<path d="M516.87 273C514.7 265.61 510.13 258.42 502.61 252.06C479.88 235.62 458.61 220.96 438.37 214.51C410.37 204.92 382.02 223.83 408.98 255.72C420.42 267.18 431.92 252.94 439.53 250.28C446.11 246.64 449.95 254.44 447.18 264.1C440.41 281.22 417.5 286 401.5 271.32C370.3 237.32 377.61 188.41 427.95 193.05C457.95 196.29 490.84 223.54 523.05 249.26C528.103 253.997 531.768 260.024 533.65 266.69" fill="#D3D3D3"/>
<path d="M524.28 273C522.11 265.61 517.54 258.42 510.02 252.06C487.29 235.62 466.02 220.96 445.78 214.51C417.78 204.92 389.43 223.83 416.39 255.72C427.83 267.18 439.33 252.94 446.94 250.28C453.52 246.64 457.36 254.44 454.59 264.1C447.82 281.22 424.91 286 408.91 271.32C377.71 237.32 385.02 188.41 435.36 193.05C465.36 196.29 498.25 223.54 530.46 249.26C535.513 253.997 539.178 260.024 541.06 266.69" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M287.189 653.802C288.889 653.802 290.27 654.44 291.332 655.715C292.607 656.777 293.245 658.158 293.245 659.858C293.245 661.77 292.607 663.364 291.332 664.639C290.27 665.701 288.889 666.232 287.189 666.232H256.592V713.403C256.592 715.528 255.954 717.334 254.679 718.821C253.617 720.096 252.023 720.734 249.899 720.734C247.774 720.734 246.074 720.096 244.799 718.821C243.737 717.334 243.206 715.528 243.206 713.403V666.232H142.49L142.171 666.87V666.232H139.622C137.497 666.232 135.797 665.701 134.522 664.639C133.247 663.364 132.61 661.877 132.61 660.177C132.61 658.477 133.247 656.671 134.522 654.759L244.162 495.717C245.437 493.805 247.455 492.849 250.217 492.849C251.917 492.849 253.405 493.486 254.679 494.761C255.954 496.036 256.592 497.842 256.592 500.179V653.802H287.189ZM151.095 653.802H243.206V520.577L151.095 653.802Z" fill="#0E0E0E"/>
<path d="M913.119 653.802C914.819 653.802 916.2 654.44 917.262 655.715C918.537 656.777 919.174 658.158 919.174 659.858C919.174 661.77 918.537 663.364 917.262 664.639C916.2 665.701 914.819 666.232 913.119 666.232H882.522V713.403C882.522 715.528 881.884 717.334 880.609 718.821C879.547 720.096 877.953 720.734 875.829 720.734C873.704 720.734 872.004 720.096 870.729 718.821C869.667 717.334 869.135 715.528 869.135 713.403V666.232H768.42L768.101 666.87V666.232H765.551C763.427 666.232 761.727 665.701 760.452 664.639C759.177 663.364 758.54 661.877 758.54 660.177C758.54 658.477 759.177 656.671 760.452 654.759L870.092 495.717C871.366 493.805 873.385 492.849 876.147 492.849C877.847 492.849 879.334 493.486 880.609 494.761C881.884 496.036 882.522 497.842 882.522 500.179V653.802H913.119ZM777.025 653.802H869.135V520.577L777.025 653.802Z" fill="#0E0E0E"/>
<path d="M174.88 354.24C183.104 354.24 189.77 347.574 189.77 339.35C189.77 331.126 183.104 324.46 174.88 324.46C166.656 324.46 159.99 331.126 159.99 339.35C159.99 347.574 166.656 354.24 174.88 354.24Z" fill="#E2E2E2"/>
<path d="M148.49 392C152.08 392 154.99 389.09 154.99 385.5C154.99 381.91 152.08 379 148.49 379C144.9 379 141.99 381.91 141.99 385.5C141.99 389.09 144.9 392 148.49 392Z" fill="#E2E2E2"/>
<path d="M267.24 434.5C290.574 434.5 309.49 415.584 309.49 392.25C309.49 368.916 290.574 350 267.24 350C243.906 350 224.99 368.916 224.99 392.25C224.99 415.584 243.906 434.5 267.24 434.5Z" fill="#E2E2E2"/>
<path d="M696.1 866.22C701.131 866.22 705.21 862.141 705.21 857.11C705.21 852.079 701.131 848 696.1 848C691.069 848 686.99 852.079 686.99 857.11C686.99 862.141 691.069 866.22 696.1 866.22Z" fill="#E2E2E2"/>
<path d="M626.24 904.5C647.365 904.5 664.49 887.375 664.49 866.25C664.49 845.125 647.365 828 626.24 828C605.115 828 587.99 845.125 587.99 866.25C587.99 887.375 605.115 904.5 626.24 904.5Z" fill="#E2E2E2"/>
<path d="M692.99 924C696.304 924 698.99 921.314 698.99 918C698.99 914.686 696.304 912 692.99 912C689.676 912 686.99 914.686 686.99 918C686.99 921.314 689.676 924 692.99 924Z" fill="#E2E2E2"/>
<path d="M815.99 180L827.99 155.23" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M787.99 178L779.91 155.23" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M821.99 212L833.99 210" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M560.05 878L529.91 894" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M568.33 904.5L560.05 938" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M568.33 848L548.78 828" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
''';
