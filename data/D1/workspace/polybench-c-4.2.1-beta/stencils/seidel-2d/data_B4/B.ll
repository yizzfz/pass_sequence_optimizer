; ModuleID = 'A.ll'
source_filename = "seidel-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_seidel_2d(i32 500, i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %6
  br label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = sext i32 %0 to i64
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader.preheader.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  %5 = sitofp i32 %0 to double
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %6 = icmp eq i32 %0, 1
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %indvars.iv26 = phi i64 [ 0, %.preheader.preheader.preheader ], [ %indvars.iv.next3, %.preheader._crit_edge..preheader.preheader_crit_edge ]
  %7 = trunc i64 %indvars.iv26 to i32
  %8 = sitofp i32 %7 to double
  br i1 %lcmp.mod, label %.preheader.preheader..preheader.prol.loopexit_crit_edge, label %.preheader.prol

.preheader.preheader..preheader.prol.loopexit_crit_edge: ; preds = %.preheader.preheader
  br label %.preheader.prol.loopexit

.preheader.prol:                                  ; preds = %.preheader.preheader
  %9 = fmul double %8, 2.000000e+00
  %10 = fadd double %9, 2.000000e+00
  %11 = fdiv double %10, %5
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 0
  store double %11, double* %12, align 8
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.preheader..preheader.prol.loopexit_crit_edge, %.preheader.prol
  %indvars.iv5.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader..preheader.prol.loopexit_crit_edge ]
  br i1 %6, label %.preheader.prol.loopexit..preheader._crit_edge_crit_edge, label %.preheader.preheader10

.preheader.prol.loopexit..preheader._crit_edge_crit_edge: ; preds = %.preheader.prol.loopexit
  br label %.preheader._crit_edge

.preheader.preheader10:                           ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader..preheader_crit_edge, %.preheader.preheader10
  %indvars.iv5 = phi i64 [ %13, %.preheader..preheader_crit_edge ], [ %indvars.iv5.unr.ph, %.preheader.preheader10 ]
  %13 = add nsw i64 %indvars.iv5, 2
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fmul double %8, %15
  %17 = fadd double %16, 2.000000e+00
  %18 = fdiv double %17, %5
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  store double %18, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %20 = add nsw i64 %indvars.iv5, 3
  %21 = trunc i64 %20 to i32
  %22 = sitofp i32 %21 to double
  %23 = fmul double %8, %22
  %24 = fadd double %23, 2.000000e+00
  %25 = fdiv double %24, %5
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv.next
  store double %25, double* %26, align 8
  %exitcond.1 = icmp eq i64 %13, %wide.trip.count
  br i1 %exitcond.1, label %.preheader._crit_edge.loopexit, label %.preheader..preheader_crit_edge

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  br label %.preheader

.preheader._crit_edge.loopexit:                   ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader.prol.loopexit..preheader._crit_edge_crit_edge, %.preheader._crit_edge.loopexit
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, %3
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader._crit_edge..preheader.preheader_crit_edge

.preheader._crit_edge..preheader.preheader_crit_edge: ; preds = %.preheader._crit_edge
  br label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d(i32, i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader3.preheader.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %3
  br label %._crit_edge

.preheader3.preheader.lr.ph:                      ; preds = %3
  %5 = add i32 %1, -1
  %6 = add nsw i32 %1, -2
  %7 = icmp slt i32 %6, 1
  %wide.trip.count = zext i32 %5 to i64
  %exitcond6 = icmp eq i32 %5, 1
  br i1 %7, label %.preheader3.preheader.lr.ph.._crit_edge_crit_edge, label %.preheader3.preheader.preheader

.preheader3.preheader.lr.ph.._crit_edge_crit_edge: ; preds = %.preheader3.preheader.lr.ph
  br label %._crit_edge

.preheader3.preheader.preheader:                  ; preds = %.preheader3.preheader.lr.ph
  %8 = sext i32 %6 to i64
  br label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %.preheader3._crit_edge..preheader3.preheader_crit_edge, %.preheader3.preheader.preheader
  %.0210 = phi i32 [ 0, %.preheader3.preheader.preheader ], [ %33, %.preheader3._crit_edge..preheader3.preheader_crit_edge ]
  br i1 %exitcond6, label %.preheader3.preheader..preheader3._crit_edge_crit_edge, label %.preheader.preheader.preheader

.preheader3.preheader..preheader3._crit_edge_crit_edge: ; preds = %.preheader3.preheader
  br label %.preheader3._crit_edge

.preheader.preheader.preheader:                   ; preds = %.preheader3.preheader
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %indvar = phi i64 [ %9, %.preheader3..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %indvars.iv48 = phi i64 [ %11, %.preheader3..preheader.preheader_crit_edge ], [ 1, %.preheader.preheader.preheader ]
  %9 = add i64 %indvar, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %9, i64 0
  %10 = add nsw i64 %indvars.iv48, -1
  %11 = add nuw nsw i64 %indvars.iv48, 1
  %load_initial = load double, double* %scevgep, align 8
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %10, i64 0
  %.pre = load double, double* %.phi.trans.insert, align 8
  %.phi.trans.insert30 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %10, i64 1
  %.pre31 = load double, double* %.phi.trans.insert30, align 8
  %.phi.trans.insert32 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv48, i64 1
  %.pre33 = load double, double* %.phi.trans.insert32, align 8
  %.phi.trans.insert34 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %11, i64 0
  %.pre35 = load double, double* %.phi.trans.insert34, align 8
  %.phi.trans.insert36 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %11, i64 1
  %.pre37 = load double, double* %.phi.trans.insert36, align 8
  br label %.preheader

.preheader:                                       ; preds = %.preheader..preheader_crit_edge, %.preheader.preheader
  %12 = phi double [ %.pre37, %.preheader.preheader ], [ %30, %.preheader..preheader_crit_edge ]
  %13 = phi double [ %.pre35, %.preheader.preheader ], [ %12, %.preheader..preheader_crit_edge ]
  %14 = phi double [ %.pre33, %.preheader.preheader ], [ %25, %.preheader..preheader_crit_edge ]
  %15 = phi double [ %.pre31, %.preheader.preheader ], [ %19, %.preheader..preheader_crit_edge ]
  %16 = phi double [ %.pre, %.preheader.preheader ], [ %15, %.preheader..preheader_crit_edge ]
  %store_forwarded = phi double [ %load_initial, %.preheader.preheader ], [ %32, %.preheader..preheader_crit_edge ]
  %indvars.iv7 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next, %.preheader..preheader_crit_edge ]
  %17 = fadd double %16, %15
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %10, i64 %indvars.iv.next
  %19 = load double, double* %18, align 8
  %20 = fadd double %17, %19
  %21 = fadd double %20, %store_forwarded
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv7
  %23 = fadd double %21, %14
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv.next
  %25 = load double, double* %24, align 8
  %26 = fadd double %23, %25
  %27 = fadd double %26, %13
  %28 = fadd double %27, %12
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %11, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fadd double %28, %30
  %32 = fdiv double %31, 9.000000e+00
  store double %32, double* %22, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.preheader3, label %.preheader..preheader_crit_edge

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  br label %.preheader

.preheader3:                                      ; preds = %.preheader
  %exitcond27 = icmp eq i64 %indvars.iv48, %8
  br i1 %exitcond27, label %.preheader3._crit_edge.loopexit, label %.preheader3..preheader.preheader_crit_edge

.preheader3..preheader.preheader_crit_edge:       ; preds = %.preheader3
  br label %.preheader.preheader

.preheader3._crit_edge.loopexit:                  ; preds = %.preheader3
  br label %.preheader3._crit_edge

.preheader3._crit_edge:                           ; preds = %.preheader3.preheader..preheader3._crit_edge_crit_edge, %.preheader3._crit_edge.loopexit
  %33 = add nuw nsw i32 %.0210, 1
  %exitcond29 = icmp eq i32 %33, %0
  br i1 %exitcond29, label %._crit_edge.loopexit, label %.preheader3._crit_edge..preheader3.preheader_crit_edge

.preheader3._crit_edge..preheader3.preheader_crit_edge: ; preds = %.preheader3._crit_edge
  br label %.preheader3.preheader

._crit_edge.loopexit:                             ; preds = %.preheader3._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader3.preheader.lr.ph.._crit_edge_crit_edge, %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.preheader.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %indvars.iv26 = phi i64 [ 0, %.preheader.preheader.preheader ], [ %indvars.iv.next3, %.preheader._crit_edge..preheader.preheader_crit_edge ]
  %9 = mul nsw i64 %indvars.iv26, %7
  br label %.preheader._crit_edge10

.preheader._crit_edge10:                          ; preds = %.preheader..preheader._crit_edge10_crit_edge, %.preheader.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader..preheader._crit_edge10_crit_edge ]
  %10 = add nsw i64 %indvars.iv5, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %.preheader._crit_edge10..preheader_crit_edge

.preheader._crit_edge10..preheader_crit_edge:     ; preds = %.preheader._crit_edge10
  br label %.preheader

; <label>:14:                                     ; preds = %.preheader._crit_edge10
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %.preheader

.preheader:                                       ; preds = %.preheader._crit_edge10..preheader_crit_edge, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.preheader._crit_edge, label %.preheader..preheader._crit_edge10_crit_edge

.preheader..preheader._crit_edge10_crit_edge:     ; preds = %.preheader
  br label %.preheader._crit_edge10

.preheader._crit_edge:                            ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next3, %7
  br i1 %exitcond9, label %._crit_edge.loopexit, label %.preheader._crit_edge..preheader.preheader_crit_edge

.preheader._crit_edge..preheader.preheader_crit_edge: ; preds = %.preheader._crit_edge
  br label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
