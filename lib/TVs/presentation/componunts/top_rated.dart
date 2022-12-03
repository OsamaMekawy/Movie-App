import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_archticture2/TVs/presentation/controller/movies_bloc.dart';
import 'package:clean_archticture2/TVs/presentation/controller/movies_states.dart';
import 'package:clean_archticture2/core/network/api_constance.dart';

import 'package:clean_archticture2/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class TopRated extends StatelessWidget {
  const TopRated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc,MoviesState>(
        buildWhen: (previous, current)=> previous.topReatedState !=current.topReatedState,
      builder: (context,state){
        switch(state.topReatedState){

          case ReqestState.Loading:

            return const SizedBox(height: 170 ,child: Center(child: CircularProgressIndicator(),));
          case ReqestState.Loaded:
           return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topReatedMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.topReatedMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.imageUrl(movie.backdroppath!),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );

          case ReqestState.error:
            return SizedBox(
              height: 170,
              child: Center(
                child: Text(state.nowPlayingMessage),
              ),
            );
        }
      }

    );
  }
}
