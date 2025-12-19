package com.nhdkn16.historicaltravel.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import com.nhdkn16.historicaltravel.entity.TourSchedule;

public interface TourScheduleService {

    TourSchedule createSchedule(TourSchedule schedule);

    TourSchedule updateSchedule(Long scheduleId, TourSchedule updatedSchedule);

    void deleteSchedule(Long scheduleId);

    Optional<TourSchedule> getScheduleById(Long scheduleId);

    List<TourSchedule> getSchedulesByTour(Long tourId);

    List<TourSchedule> getAvailableSchedules();

    List<TourSchedule> getSchedulesAfterDate(LocalDate date);

    Optional<TourSchedule> getDefaultSchedule(Long tourId);
}
