-- Copyright 2016 The Cartographer Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

include "map_builder.lua"
include "trajectory_builder.lua"
options = {
map_builder = MAP_BUILDER,
trajectory_builder = TRAJECTORY_BUILDER,
map_frame = "map",
tracking_frame = "imu_link",
published_frame = "base_link",
odom_frame = "odom",
provide_odom_frame = true,
publish_frame_projected_to_2d = false,
use_odometry = false,
use_nav_sat = true,
use_landmarks = false,
num_laser_scans = 0,
num_multi_echo_laser_scans = 0,
num_subdivisions_per_laser_scan = 1,
num_point_clouds = 1,
lookup_transform_timeout_sec = 0.2,
submap_publish_period_sec = 0.3,
pose_publish_period_sec = 5e-3,
trajectory_publish_period_sec = 30e-3,
rangefinder_sampling_ratio = 1.,
odometry_sampling_ratio = 1,
fixed_frame_pose_sampling_ratio = 1.0,
imu_sampling_ratio = 1.0,
landmarks_sampling_ratio = 1.,
}


-- GENERAL
MAP_BUILDER.use_trajectory_builder_3d = true

--Tune Input data
TRAJECTORY_BUILDER_3D.num_accumulated_range_data = 1
TRAJECTORY_BUILDER_3D.submaps.num_range_data = 20
TRAJECTORY_BUILDER_3D.voxel_filter_size = 0.40
TRAJECTORY_BUILDER_3D.submaps.high_resolution = 0.40
TRAJECTORY_BUILDER_3D.submaps.low_resolution = 1.0
TRAJECTORY_BUILDER_3D.min_range = 3


-- GLOBAL SLAM
MAP_BUILDER.num_background_threads = 10
POSE_GRAPH.constraint_builder.sampling_ratio = 0.6
POSE_GRAPH.constraint_builder.min_score = 0.2
POSE_GRAPH.global_sampling_ratio = 0.4
--POSE_GRAPH.optimization_problem.fixed_frame_pose_translation_weight = 1e10

POSE_GRAPH.constraint_builder.max_constraint_distance = 40

POSE_GRAPH.optimization_problem.log_solver_summary = true

return options