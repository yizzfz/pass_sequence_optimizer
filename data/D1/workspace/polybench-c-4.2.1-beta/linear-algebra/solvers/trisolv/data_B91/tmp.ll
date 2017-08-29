; ModuleID = 'A.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = bitcast i8* %3 to [2000 x double]*
  %7 = bitcast i8* %4 to double*
  %8 = bitcast i8* %5 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_trisolv(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 2000, double* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph:
  br label %4

; <label>:4:                                      ; preds = %.unr-lcssa, %.lr.ph
  %indvars.iv39 = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next4, %.unr-lcssa ]
  %indvars.iv58 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next6, %.unr-lcssa ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv58
  store double -9.990000e+02, double* %5, align 8
  %6 = trunc i64 %indvars.iv58 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv58
  store double %7, double* %8, align 8
  %9 = add nsw i64 %indvars.iv58, 2001
  %10 = and i64 %indvars.iv58, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %4
  %11 = trunc i64 %9 to i32
  %12 = sitofp i32 %11 to double
  %13 = fmul double %12, 2.000000e+00
  %14 = fdiv double %13, 2.000000e+03
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 0
  store double %14, double* %15, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %4
  %indvars.iv7.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %4 ]
  %16 = icmp eq i64 %indvars.iv58, 0
  br i1 %16, label %.unr-lcssa, label %.new.preheader

.new.preheader:                                   ; preds = %.prol.loopexit
  br label %.new

.new:                                             ; preds = %.new.preheader, %.new
  %indvars.iv7 = phi i64 [ %indvars.iv.next.1, %.new ], [ %indvars.iv7.unr.ph, %.new.preheader ]
  %17 = sub nsw i64 %9, %indvars.iv7
  %18 = trunc i64 %17 to i32
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %21 = sub nsw i64 %9, %indvars.iv.next
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %19, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fmul <2 x double> %25, <double 2.000000e+00, double 2.000000e+00>
  %27 = fdiv <2 x double> %26, <double 2.000000e+03, double 2.000000e+03>
  %28 = bitcast double* %20 to <2 x double>*
  store <2 x double> %27, <2 x double>* %28, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv7, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv39
  br i1 %exitcond.1, label %.unr-lcssa.loopexit, label %.new

.unr-lcssa.loopexit:                              ; preds = %.new
  br label %.unr-lcssa

.unr-lcssa:                                       ; preds = %.unr-lcssa.loopexit, %.prol.loopexit
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv58, 1
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 2000
  br i1 %exitcond, label %._crit_edge, label %4

._crit_edge:                                      ; preds = %.unr-lcssa
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]* nocapture readonly, double*, double* nocapture readonly) unnamed_addr #2 {
.lr.ph16:
  %sunkaddr8 = ptrtoint double* %2 to i64
  br label %4

; <label>:4:                                      ; preds = %._crit_edge, %.lr.ph16
  %indvars.iv314 = phi i64 [ 0, %.lr.ph16 ], [ %indvars.iv.next4, %._crit_edge ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv314
  %6 = load double, double* %5, align 8
  %7 = getelementptr inbounds double, double* %2, i64 %indvars.iv314
  store double %6, double* %7, align 8
  %exitcond12 = icmp eq i64 %indvars.iv314, 0
  %.pre = shl i64 %indvars.iv314, 3
  %.pre22 = add i64 %sunkaddr8, %.pre
  %.pre23 = inttoptr i64 %.pre22 to double*
  br i1 %exitcond12, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %4
  %xtraiter = and i64 %indvars.iv314, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv314, i64 0
  %9 = load double, double* %8, align 8
  %10 = load double, double* %2, align 8
  %11 = fmul double %9, %10
  %12 = fsub double %6, %11
  store double %12, double* %.pre23, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %.lcssa19.unr.ph = phi double [ %12, %.prol.preheader ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %12, %.prol.preheader ], [ %6, %.lr.ph ]
  %indvars.iv13.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %13 = icmp eq i64 %indvars.iv314, 1
  br i1 %13, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %14 = phi double [ %26, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %indvars.iv13 = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv13.unr.ph, %.lr.ph.new.preheader ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv314, i64 %indvars.iv13
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds double, double* %2, i64 %indvars.iv13
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %14, %19
  store double %20, double* %.pre23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv314, i64 %indvars.iv.next
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %.pre23, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv13, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv314
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa19.unr.ph, %.prol.loopexit ], [ %6, %4 ], [ %26, %._crit_edge.loopexit ]
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv314, i64 %indvars.iv314
  %28 = load double, double* %27, align 8
  %29 = fdiv double %.lcssa, %28
  store double %29, double* %.pre23, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv314, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond, label %._crit_edge17, label %4

._crit_edge17:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge
  %7 = phi %struct._IO_FILE* [ %16, %._crit_edge ], [ %6, %.lr.ph.preheader ]
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %9 = load double, double* %8, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %9) #6
  %11 = trunc i64 %indvars.iv1 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %.lr.ph
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge3, label %.lr.ph

._crit_edge3:                                     ; preds = %._crit_edge
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
