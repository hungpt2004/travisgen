import 'package:travisgen_client/data/model/onboarding.dart';
import 'package:travisgen_client/generated/assets.gen.dart';

final onBoardingStepConstant = <Onboarding>[
  Onboarding(
    lottie: Assets.animations.lottieStudy.path,
    title: 'Học tập mọi lúc',
    description:
        'Học mọi lúc mọi nơi với bài giảng tương tác và lộ trình cá nhân hóa, giúp bạn tiến bộ nhanh và hiệu quả.',
  ),
  Onboarding(
    lottie: Assets.animations.lottieAi.path,
    title: 'Trợ lý AI 24/7',
    description:
        'Trợ lý AI 24/7 giải đáp thắc mắc và gợi ý học tập cá nhân, tối ưu thời gian và nâng cao kết quả học tập.',
  ),
  Onboarding(
    lottie: Assets.animations.lottieBussiness.path,
    title: 'Cơ hội nghề nghiệp',
    description:
        'Mở rộng cơ hội nghề nghiệp với hồ sơ nổi bật, đề xuất việc làm phù hợp và lộ trình phát triển kỹ năng chuyên sâu.',
  ),
];
