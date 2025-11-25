package com.nhdkn16.historicaltravel.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.Tour;
import com.nhdkn16.historicaltravel.entity.TourSchedule;
import com.nhdkn16.historicaltravel.repository.TourRepository;
import com.nhdkn16.historicaltravel.repository.TourScheduleRepository;
import com.nhdkn16.historicaltravel.service.TourScheduleService;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TourScheduleServiceImpl implements TourScheduleService {

    private final TourScheduleRepository scheduleRepository;
    private final TourRepository tourRepository;

    @Override
    public TourSchedule createSchedule(TourSchedule schedule) {
        return scheduleRepository.save(schedule);
    }

    @Override
    public TourSchedule updateSchedule(Long scheduleId, TourSchedule updated) {
        return scheduleRepository.findById(scheduleId)
                .map(schedule -> {
                    schedule.setStartDate(updated.getStartDate());
                    schedule.setAvailableSlots(updated.getAvailableSlots());
                    schedule.setStatus(updated.getStatus());
                    schedule.setTour(updated.getTour());
                    return scheduleRepository.save(schedule);
                })
                .orElseThrow(() -> new RuntimeException("Schedule not found"));
    }

    @Override
    public void deleteSchedule(Long scheduleId) {
        if (!scheduleRepository.existsById(scheduleId)) {
            throw new RuntimeException("Schedule not found");
        }
        scheduleRepository.deleteById(scheduleId);
    }

    @Override
    public Optional<TourSchedule> getScheduleById(Long scheduleId) {
        return scheduleRepository.findById(scheduleId);
    }

    @Override
    public List<TourSchedule> getSchedulesByTour(Long tourId) {
        Tour tour = tourRepository.findById(tourId)
                .orElseThrow(() -> new RuntimeException("Tour not found"));
        return scheduleRepository.findByTour(tour);
    }

    @Override
    public List<TourSchedule> getAvailableSchedules() {
        return scheduleRepository.findByStatus(TourSchedule.Status.AVAILABLE);
    }

    @Override
    public List<TourSchedule> getSchedulesAfterDate(LocalDate date) {
        return scheduleRepository.findByStartDateAfter(date);
    }
}
