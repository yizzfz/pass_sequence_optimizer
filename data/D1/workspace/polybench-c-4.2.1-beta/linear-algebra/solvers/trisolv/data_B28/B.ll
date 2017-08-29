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
  tail call fastcc void @init_array([2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_trisolv([2000 x double]* %6, double* %7, double* %8)
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
  %14 = bitcast i8* %4 to double*
  tail call fastcc void @print_array(double* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %3
  %indvars.iv8 = phi i64 [ 0, %3 ], [ %indvars.iv.next9, %._crit_edge ]
  %indvars.iv6 = phi i64 [ 1, %3 ], [ %indvars.iv.next7, %._crit_edge ]
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %4 = getelementptr inbounds double, double* %1, i64 %indvars.iv8
  store double -9.990000e+02, double* %4, align 8
  %5 = trunc i64 %indvars.iv8 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds double, double* %2, i64 %indvars.iv8
  store double %6, double* %7, align 8
  %8 = add nuw nsw i64 %indvars.iv8, 2001
  %xtraiter10 = and i64 %indvars.iv.next9, 1
  %lcmp.mod = icmp eq i64 %xtraiter10, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fmul double %10, 2.000000e+00
  %12 = fdiv double %11, 2.000000e+03
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 0
  store double %12, double* %13, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %14 = icmp eq i64 %indvars.iv8, 0
  br i1 %14, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %15 = sub nuw nsw i64 %8, %indvars.iv
  %16 = trunc i64 %15 to i32
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = sub nuw nsw i64 %8, %indvars.iv.next
  %20 = trunc i64 %19 to i32
  %21 = sitofp i32 %20 to double
  %22 = insertelement <2 x double> undef, double %17, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fmul <2 x double> %23, <double 2.000000e+00, double 2.000000e+00>
  %25 = fdiv <2 x double> %24, <double 2.000000e+03, double 2.000000e+03>
  %26 = bitcast double* %18 to <2 x double>*
  store <2 x double> %25, <2 x double>* %26, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv6
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond, label %27, label %.lr.ph

; <label>:27:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv([2000 x double]* nocapture readonly, double*, double* nocapture readonly) unnamed_addr #2 {
  %sunkaddr19 = ptrtoint double* %1 to i64
  %sunkaddr = ptrtoint double* %1 to i64
  %4 = ptrtoint double* %1 to i64
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %3
  %indvars.iv10 = phi i64 [ 0, %3 ], [ %indvars.iv.next11, %._crit_edge ]
  %5 = add nuw nsw i64 %indvars.iv10, 4294967295
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv10
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv10
  store double %7, double* %8, align 8
  %9 = icmp sgt i64 %indvars.iv10, 0
  br i1 %9, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge._crit_edge
  %xtraiter12 = and i64 %indvars.iv10, 1
  %lcmp.mod = icmp eq i64 %xtraiter12, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 0
  %11 = load double, double* %10, align 8
  %12 = load double, double* %1, align 8
  %13 = fmul double %11, %12
  %14 = fsub double %7, %13
  %sunkaddr16 = shl i64 %indvars.iv10, 3
  %sunkaddr17 = add i64 %sunkaddr, %sunkaddr16
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to double*
  store double %14, double* %sunkaddr18, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %14, %.prol.preheader ], [ %7, %.lr.ph ]
  %.lcssa5.unr.ph = phi double [ %14, %.prol.preheader ], [ undef, %.lr.ph ]
  %15 = trunc i64 %5 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr20 = shl i64 %indvars.iv10, 3
  %sunkaddr21 = add i64 %sunkaddr19, %sunkaddr20
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to double*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %17 = phi double [ %29, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %sunkaddr22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv.next
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %sunkaddr22, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv10
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %._crit_edge._crit_edge
  %.lcssa = phi double [ %7, %._crit_edge._crit_edge ], [ %.lcssa5.unr.ph, %.prol.loopexit ], [ %29, %._crit_edge.loopexit ]
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv10
  %31 = load double, double* %30, align 8
  %32 = fdiv double %.lcssa, %31
  %sunkaddr6 = shl nsw i64 %indvars.iv10, 3
  %sunkaddr7 = add i64 %4, %sunkaddr6
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to double*
  store double %32, double* %sunkaddr8, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond, label %33, label %._crit_edge._crit_edge

; <label>:33:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = phi %struct._IO_FILE* [ %6, %1 ], [ %16, %._crit_edge ]
  %8 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %9) #6
  %11 = trunc i64 %indvars.iv to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge2
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %17, label %._crit_edge2

; <label>:17:                                     ; preds = %._crit_edge
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
