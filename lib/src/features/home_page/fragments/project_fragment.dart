import 'package:bdt_hakaton/src/theme/image_sources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProjectFragment extends StatelessWidget {
  const ProjectFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Image.asset(ImageSources.robotProjectInfo)),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      'Не уверены, индексирует ли Google ваш сайт? Тогда "Индекс-чекер" станет вашим незаменимым помощником. Наш сервис быстро проверит индексацию вашего сайта Google и предоставит подробную информацию. Анализируя результаты, вы сможете выявить проблемы с индексацией и получить ценные советы по их устранению. Используйте "Индекс-чекер", чтобы улучшить видимость вашего сайта в результатах поиска и повысить его посещаемость. Индексация Google: проверка и рекомендации всего за несколько кликов!',
                      style: Theme.of(context).textTheme.bodyLarge,
                       textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
