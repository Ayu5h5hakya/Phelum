import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:phelum/data/repository.dart';
import 'package:phelum/model/dashboard_item.dart';
import 'package:phelum/model/movie.dart';
import 'package:phelum/model/user_profile.dart';

@immutable
abstract class ProfileState extends Equatable {
  ProfileState([List props = const []]) : super(props);
}

class ProfileLoading extends ProfileState {
  @override
  String toString() => 'ProfileLoading';
}

class ProfileLoaded extends ProfileState {
  final ParsedMoviesReponse<UserProfile> userProfile;

  ProfileLoaded([this.userProfile]) : super([userProfile]);

  @override
  String toString() => 'ProfileLoaded { userProfile: $userProfile }';
}

class ProfileNotLoaded extends ProfileState {
  @override
  String toString() => 'ProfileNotLoaded';
}

