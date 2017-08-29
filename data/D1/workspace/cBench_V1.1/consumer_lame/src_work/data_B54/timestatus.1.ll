; ModuleID = 'timestatus.ll'
source_filename = "timestatus.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.ts_times = type { float, float, float, float }

@ts_real_time.initial_time = internal unnamed_addr global i64 0, align 8
@ts_process_time.initial_time = internal unnamed_addr global i64 0, align 8
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [75 x i8] c"    Frame          |  CPU/estimated  |  time/estimated | play/CPU |   ETA\0A\00", align 1
@.str.1 = private unnamed_addr constant [96 x i8] c"\0D%6ld/%6ld(%3d%%)|%2d:%02d:%02d/%2d:%02d:%02d|%2d:%02d:%02d/%2d:%02d:%02d|%10.4f|%2d:%02d:%02d \00", align 1

; Function Attrs: noinline nounwind uwtable
define float @ts_real_time(i64) local_unnamed_addr #0 {
  %2 = alloca i64, align 8
  %3 = call i64 @time(i64* nonnull %2) #4
  %4 = icmp eq i64 %0, 0
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %1
  %6 = load i64, i64* %2, align 8
  store i64 %6, i64* @ts_real_time.initial_time, align 8
  br label %7

; <label>:7:                                      ; preds = %5, %1
  %8 = load i64, i64* %2, align 8
  %9 = load i64, i64* @ts_real_time.initial_time, align 8
  %10 = call double @difftime(i64 %8, i64 %9) #5
  %11 = fptrunc double %10 to float
  ret float %11
}

; Function Attrs: nounwind
declare i64 @time(i64*) local_unnamed_addr #1

; Function Attrs: nounwind readnone
declare double @difftime(i64, i64) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define float @ts_process_time(i64) local_unnamed_addr #0 {
  %2 = tail call i64 @clock() #4
  %3 = icmp eq i64 %0, 0
  br i1 %3, label %4, label %5

; <label>:4:                                      ; preds = %1
  store i64 %2, i64* @ts_process_time.initial_time, align 8
  br label %5

; <label>:5:                                      ; preds = %4, %1
  %6 = load i64, i64* @ts_process_time.initial_time, align 8
  %7 = sub nsw i64 %2, %6
  %8 = sitofp i64 %7 to float
  %9 = fdiv float %8, 1.000000e+06
  ret float %9
}

; Function Attrs: nounwind
declare i64 @clock() local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define void @ts_calc_times(%struct.ts_times* nocapture, i32, i64, i64, i32) local_unnamed_addr #3 {
  %6 = icmp sgt i64 %2, 0
  br i1 %6, label %7, label %26

; <label>:7:                                      ; preds = %5
  %8 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %0, i64 0, i32 0
  %9 = load float, float* %8, align 4
  %10 = sitofp i64 %3 to float
  %11 = fmul float %10, %9
  %12 = sitofp i64 %2 to float
  %13 = fdiv float %11, %12
  %14 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %0, i64 0, i32 1
  store float %13, float* %14, align 4
  %15 = sitofp i32 %1 to float
  %16 = fmul float %15, %13
  %17 = fcmp ogt float %16, 0.000000e+00
  %18 = sext i32 %4 to i64
  %19 = mul nsw i64 %18, %3
  %20 = sitofp i64 %19 to float
  %21 = fdiv float %20, %16
  %.sink = select i1 %17, float %21, float 0.000000e+00
  %22 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %0, i64 0, i32 2
  store float %.sink, float* %22, align 4
  %23 = load float, float* %14, align 4
  %24 = load float, float* %8, align 4
  %25 = fsub float %23, %24
  br label %29

; <label>:26:                                     ; preds = %5
  %27 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %0, i64 0, i32 1
  store float 0.000000e+00, float* %27, align 4
  %28 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %0, i64 0, i32 2
  store float 0.000000e+00, float* %28, align 4
  br label %29

; <label>:29:                                     ; preds = %26, %7
  %.sink2 = phi float [ 0.000000e+00, %26 ], [ %25, %7 ]
  %30 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %0, i64 0, i32 3
  store float %.sink2, float* %30, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @timestatus(i32, i64, i64, i32) local_unnamed_addr #0 {
  %5 = alloca %struct.ts_times, align 4
  %6 = alloca %struct.ts_times, align 4
  %7 = tail call float @ts_real_time(i64 %1)
  %8 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %5, i64 0, i32 0
  store float %7, float* %8, align 4
  %9 = tail call float @ts_process_time(i64 %1)
  %10 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %6, i64 0, i32 0
  store float %9, float* %10, align 4
  %11 = icmp eq i64 %1, 0
  br i1 %11, label %12, label %15

; <label>:12:                                     ; preds = %4
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i64 0, i64 0), i64 74, i64 1, %struct._IO_FILE* %13) #6
  br label %96

; <label>:15:                                     ; preds = %4
  call void @ts_calc_times(%struct.ts_times* nonnull %5, i32 %0, i64 %1, i64 %2, i32 %3)
  call void @ts_calc_times(%struct.ts_times* nonnull %6, i32 %0, i64 %1, i64 %2, i32 %3)
  %16 = icmp sgt i64 %2, 1
  br i1 %16, label %17, label %24

; <label>:17:                                     ; preds = %15
  %18 = sitofp i64 %1 to double
  %19 = fmul double %18, 1.000000e+02
  %20 = add nsw i64 %2, -1
  %21 = sitofp i64 %20 to double
  %22 = fdiv double %19, %21
  %23 = fptosi double %22 to i32
  br label %24

; <label>:24:                                     ; preds = %15, %17
  %.0 = phi i32 [ %23, %17 ], [ 100, %15 ]
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = add nsw i64 %2, -1
  %27 = load float, float* %10, align 4
  %28 = fpext float %27 to double
  %29 = fadd double %28, 5.000000e-01
  %30 = fptosi double %29 to i64
  %31 = sdiv i64 %30, 3600
  %32 = trunc i64 %31 to i32
  %33 = fdiv double %29, 6.000000e+01
  %34 = fptosi double %33 to i64
  %35 = srem i64 %34, 60
  %36 = trunc i64 %35 to i32
  %37 = srem i64 %30, 60
  %38 = trunc i64 %37 to i32
  %39 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %6, i64 0, i32 1
  %40 = load float, float* %39, align 4
  %41 = fpext float %40 to double
  %42 = fadd double %41, 5.000000e-01
  %43 = fptosi double %42 to i64
  %44 = sdiv i64 %43, 3600
  %45 = trunc i64 %44 to i32
  %46 = fdiv double %42, 6.000000e+01
  %47 = fptosi double %46 to i64
  %48 = srem i64 %47, 60
  %49 = trunc i64 %48 to i32
  %50 = srem i64 %43, 60
  %51 = trunc i64 %50 to i32
  %52 = load float, float* %8, align 4
  %53 = fpext float %52 to double
  %54 = fadd double %53, 5.000000e-01
  %55 = fptosi double %54 to i64
  %56 = sdiv i64 %55, 3600
  %57 = trunc i64 %56 to i32
  %58 = fdiv double %54, 6.000000e+01
  %59 = fptosi double %58 to i64
  %60 = srem i64 %59, 60
  %61 = trunc i64 %60 to i32
  %62 = srem i64 %55, 60
  %63 = trunc i64 %62 to i32
  %64 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %5, i64 0, i32 1
  %65 = load float, float* %64, align 4
  %66 = fpext float %65 to double
  %67 = fadd double %66, 5.000000e-01
  %68 = fptosi double %67 to i64
  %69 = sdiv i64 %68, 3600
  %70 = trunc i64 %69 to i32
  %71 = fdiv double %67, 6.000000e+01
  %72 = fptosi double %71 to i64
  %73 = srem i64 %72, 60
  %74 = trunc i64 %73 to i32
  %75 = srem i64 %68, 60
  %76 = trunc i64 %75 to i32
  %77 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %6, i64 0, i32 2
  %78 = load float, float* %77, align 4
  %79 = fpext float %78 to double
  %80 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %5, i64 0, i32 3
  %81 = load float, float* %80, align 4
  %82 = fpext float %81 to double
  %83 = fadd double %82, 5.000000e-01
  %84 = fptosi double %83 to i64
  %85 = sdiv i64 %84, 3600
  %86 = trunc i64 %85 to i32
  %87 = fdiv double %83, 6.000000e+01
  %88 = fptosi double %87 to i64
  %89 = srem i64 %88, 60
  %90 = trunc i64 %89 to i32
  %91 = srem i64 %84, 60
  %92 = trunc i64 %91 to i32
  %93 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([96 x i8], [96 x i8]* @.str.1, i64 0, i64 0), i64 %1, i64 %26, i32 %.0, i32 %32, i32 %36, i32 %38, i32 %45, i32 %49, i32 %51, i32 %57, i32 %61, i32 %63, i32 %70, i32 %74, i32 %76, double %79, i32 %86, i32 %90, i32 %92) #6
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %95 = tail call i32 @fflush(%struct._IO_FILE* %94)
  br label %96

; <label>:96:                                     ; preds = %24, %12
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readnone }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
