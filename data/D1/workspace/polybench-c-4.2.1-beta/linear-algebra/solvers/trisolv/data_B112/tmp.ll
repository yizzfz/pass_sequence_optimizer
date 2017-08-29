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
  br i1 %9, label %10, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %10
  br label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 2000, double* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph3:
  br label %4

; <label>:4:                                      ; preds = %._crit_edge._crit_edge, %.lr.ph3
  %5 = phi i32 [ 0, %.lr.ph3 ], [ %11, %._crit_edge._crit_edge ]
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds double, double* %2, i64 %6
  store double -9.990000e+02, double* %7, align 8
  %8 = sitofp i32 %5 to double
  %9 = getelementptr inbounds double, double* %3, i64 %6
  store double %8, double* %9, align 8
  %10 = icmp sgt i32 %5, -1
  %11 = add i32 %5, 1
  br i1 %10, label %.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %4
  br label %._crit_edge

.lr.ph:                                           ; preds = %4
  %12 = and i64 %6, 1
  %lcmp.mod = icmp eq i64 %12, 0
  br i1 %lcmp.mod, label %13, label %.lr.ph..prol.loopexit_crit_edge

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

; <label>:13:                                     ; preds = %.lr.ph
  %14 = add i32 %5, 2001
  %15 = sitofp i32 %14 to double
  %16 = fmul double %15, 2.000000e+00
  %17 = fdiv double %16, 2.000000e+03
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %6, i64 0
  store double %17, double* %18, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %13
  %indvars.iv.unr.ph = phi i64 [ 1, %13 ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %19 = icmp eq i32 %5, 0
  br i1 %19, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %20 = add i32 %5, 2001
  %wide.trip.count.1 = zext i32 %11 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %21 = trunc i64 %indvars.iv to i32
  %22 = sub i32 %20, %21
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %6, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = trunc i64 %indvars.iv.next to i32
  %26 = sub i32 %20, %25
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %23, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fmul <2 x double> %29, <double 2.000000e+00, double 2.000000e+00>
  %31 = fdiv <2 x double> %30, <double 2.000000e+03, double 2.000000e+03>
  %32 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %.._crit_edge_crit_edge, %._crit_edge.loopexit
  %33 = icmp slt i32 %11, 2000
  br i1 %33, label %._crit_edge._crit_edge, label %.loopexit

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  br label %4

.loopexit:                                        ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]* nocapture readonly, double*, double* nocapture readonly) unnamed_addr #2 {
.lr.ph2:
  %sunkaddr19 = ptrtoint double* %2 to i64
  br label %4

; <label>:4:                                      ; preds = %._crit_edge._crit_edge, %.lr.ph2
  %indvars.iv13 = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next14, %._crit_edge._crit_edge ]
  %5 = add nuw i64 %indvars.iv13, 4294967295
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv13
  %7 = bitcast double* %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds double, double* %2, i64 %indvars.iv13
  %10 = bitcast double* %9 to i64*
  store i64 %8, i64* %10, align 8
  %11 = icmp sgt i64 %indvars.iv13, 0
  %12 = bitcast i64 %8 to double
  br i1 %11, label %.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %4
  br label %._crit_edge

.lr.ph:                                           ; preds = %4
  %xtraiter27 = and i64 %indvars.iv13, 1
  %lcmp.mod = icmp eq i64 %xtraiter27, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %13

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

; <label>:13:                                     ; preds = %.lr.ph
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 0
  %15 = load double, double* %14, align 8
  %16 = load double, double* %2, align 8
  %17 = fmul double %15, %16
  %18 = fsub double %12, %17
  %sunkaddr16 = shl i64 %indvars.iv13, 3
  %sunkaddr17 = add i64 %sunkaddr19, %sunkaddr16
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to double*
  store double %18, double* %sunkaddr18, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %13
  %indvars.iv.unr.ph = phi i64 [ 1, %13 ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %.unr.ph = phi double [ %18, %13 ], [ %12, %.lr.ph..prol.loopexit_crit_edge ]
  %.lcssa.unr.ph = phi double [ %18, %13 ], [ undef, %.lr.ph..prol.loopexit_crit_edge ]
  %19 = trunc i64 %5 to i32
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr20 = shl i64 %indvars.iv13, 3
  %sunkaddr21 = add i64 %sunkaddr19, %sunkaddr20
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to double*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %21 = phi double [ %33, %.lr.ph.new..lr.ph.new_crit_edge ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %sunkaddr22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  store double %33, double* %sunkaddr22, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv13
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %.._crit_edge_crit_edge, %._crit_edge.loopexit
  %34 = phi double [ %12, %.._crit_edge_crit_edge ], [ %.lcssa.unr.ph, %.prol.loopexit.._crit_edge_crit_edge ], [ %33, %._crit_edge.loopexit ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv13
  %36 = load double, double* %35, align 8
  %37 = fdiv double %34, %36
  %sunkaddr24 = shl i64 %indvars.iv13, 3
  %sunkaddr25 = add i64 %sunkaddr19, %sunkaddr24
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to double*
  store double %37, double* %sunkaddr26, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next14, 2000
  br i1 %exitcond28, label %.loopexit, label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  br label %4

.loopexit:                                        ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %7

; <label>:7:                                      ; preds = %._crit_edge._crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %8 = phi %struct._IO_FILE* [ %6, %.lr.ph ], [ %17, %._crit_edge._crit_edge ]
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %10) #4
  %12 = trunc i64 %indvars.iv to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %7
  br label %._crit_edge

; <label>:15:                                     ; preds = %7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %15
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond8 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond8, label %.loopexit, label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  br label %7

.loopexit:                                        ; preds = %._crit_edge
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
