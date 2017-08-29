; ModuleID = 'A.ll'
source_filename = "seidel-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_seidel_2d(i32 500, i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader.lr.ph, label %._crit_edge11

.preheader.lr.ph:                                 ; preds = %2
  %4 = sitofp i32 %0 to double
  %5 = zext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %0, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv12 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next13, %._crit_edge.us ]
  %7 = trunc i64 %indvars.iv12 to i32
  %8 = sitofp i32 %7 to double
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %9 = fmul double %8, 2.000000e+00
  %10 = fadd double %9, 2.000000e+00
  %11 = fdiv double %10, %4
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 0
  store double %11, double* %12, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %6, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %13, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %13 = add nsw i64 %indvars.iv, 2
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fmul double %8, %15
  %17 = fadd double %16, 2.000000e+00
  %18 = fdiv double %17, %4
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  store double %18, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %20 = add nsw i64 %indvars.iv, 3
  %21 = trunc i64 %20 to i32
  %22 = sitofp i32 %21 to double
  %23 = fmul double %8, %22
  %24 = fadd double %23, 2.000000e+00
  %25 = fdiv double %24, %4
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv.next
  store double %25, double* %26, align 8
  %exitcond17.1 = icmp eq i64 %13, %5
  br i1 %exitcond17.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, %5
  br i1 %exitcond, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d(i32, i32, [2000 x double]*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader37.lr.ph, label %._crit_edge42

.preheader37.lr.ph:                               ; preds = %3
  %5 = add nsw i32 %1, -2
  %6 = add i32 %1, -1
  %7 = icmp slt i32 %5, 1
  %wide.trip.count = zext i32 %6 to i64
  br label %.preheader37

.preheader37:                                     ; preds = %._crit_edge40, %.preheader37.lr.ph
  %storemerge41 = phi i32 [ 0, %.preheader37.lr.ph ], [ %31, %._crit_edge40 ]
  br i1 %7, label %._crit_edge40, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader37
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge ], [ 1, %.preheader.preheader ]
  %8 = add nsw i64 %indvars.iv43, -1
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %8, i64 0
  %.pre = load double, double* %.phi.trans.insert, align 8
  %.phi.trans.insert51 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %8, i64 1
  %.pre52 = load double, double* %.phi.trans.insert51, align 8
  %.phi.trans.insert53 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv43, i64 0
  %.pre54 = load double, double* %.phi.trans.insert53, align 8
  %.phi.trans.insert55 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv43, i64 1
  %.pre56 = load double, double* %.phi.trans.insert55, align 8
  %.phi.trans.insert57 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next44, i64 0
  %.pre58 = load double, double* %.phi.trans.insert57, align 8
  %.phi.trans.insert59 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next44, i64 1
  %.pre60 = load double, double* %.phi.trans.insert59, align 8
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50, %.preheader
  %9 = phi double [ %.pre60, %.preheader ], [ %28, %._crit_edge50 ]
  %10 = phi double [ %.pre58, %.preheader ], [ %9, %._crit_edge50 ]
  %11 = phi double [ %.pre56, %.preheader ], [ %23, %._crit_edge50 ]
  %12 = phi double [ %.pre54, %.preheader ], [ %30, %._crit_edge50 ]
  %13 = phi double [ %.pre52, %.preheader ], [ %17, %._crit_edge50 ]
  %14 = phi double [ %.pre, %.preheader ], [ %13, %._crit_edge50 ]
  %indvars.iv = phi i64 [ 1, %.preheader ], [ %indvars.iv.next, %._crit_edge50 ]
  %15 = fadd double %14, %13
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %8, i64 %indvars.iv.next
  %17 = load double, double* %16, align 8
  %18 = fadd double %15, %17
  %19 = fadd double %18, %12
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv43, i64 %indvars.iv
  %21 = fadd double %19, %11
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv43, i64 %indvars.iv.next
  %23 = load double, double* %22, align 8
  %24 = fadd double %21, %23
  %25 = fadd double %24, %10
  %26 = fadd double %25, %9
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next44, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = fadd double %26, %28
  %30 = fdiv double %29, 9.000000e+00
  store double %30, double* %20, align 8
  %exitcond49 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond49, label %._crit_edge, label %._crit_edge50

._crit_edge:                                      ; preds = %._crit_edge50
  %exitcond = icmp eq i64 %indvars.iv.next44, %wide.trip.count
  br i1 %exitcond, label %._crit_edge40.loopexit, label %.preheader

._crit_edge40.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.loopexit, %.preheader37
  %31 = add nuw nsw i32 %storemerge41, 1
  %exitcond47 = icmp eq i32 %31, %0
  br i1 %exitcond47, label %._crit_edge42.loopexit, label %.preheader37

._crit_edge42.loopexit:                           ; preds = %._crit_edge40
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %3
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge12

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count17 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge10.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge10.us ]
  %9 = mul nsw i64 %indvars.iv13, %8
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge.us

; <label>:14:                                     ; preds = %._crit_edge.us._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next, %wide.trip.count17
  br i1 %exitcond18, label %._crit_edge10.us, label %._crit_edge.us._crit_edge

._crit_edge10.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, %wide.trip.count17
  br i1 %exitcond, label %._crit_edge12.loopexit, label %.preheader.us

._crit_edge12.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
