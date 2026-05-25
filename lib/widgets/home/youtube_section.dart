import 'package:el_kabah_app_backup/datas/youtube_data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeSection extends StatelessWidget {
  const YoutubeSection({super.key});

  Future<void> openYoutube(String url) async {
    final Uri uri = Uri.parse(url);

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // TITLE
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Video ",

                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),

                TextSpan(
                  text: "YouTube",

                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 14),

          SizedBox(
            height: 165,

            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: youtubeVideos.length,
              separatorBuilder: (_, __) {
                return SizedBox(width: 14);
              },
              itemBuilder: (context, index) {
                final video = youtubeVideos[index];
                return GestureDetector(
                  onTap: () {
                    openYoutube(video["url"]!);
                  },

                  child: Container(
                    width: 270,

                    clipBehavior: Clip.hardEdge,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),

                      image: DecorationImage(
                        image: AssetImage(video["thumbnail"]!),

                        fit: BoxFit.cover,
                      ),
                    ),

                    child: Container(
                      padding: EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),

                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,

                          colors: [
                            Colors.black.withOpacity(0.08),
                            Colors.black.withOpacity(0.85),
                          ],
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [
                          // CHANNEL
                          Text(
                            video["channel"]!,

                            maxLines: 1,

                            overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              color: Colors.white.withOpacity(0.68),

                              fontSize: 12,

                              fontWeight: FontWeight.w400,

                              letterSpacing: 0.4,
                            ),
                          ),

                          SizedBox(height: 4),

                          // TITLE
                          SizedBox(
                            width: 185,

                            child: Text(
                              video["title"]!,

                              maxLines: 2,

                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                color: Colors.white,

                                fontSize: 24,

                                fontWeight: FontWeight.bold,

                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
