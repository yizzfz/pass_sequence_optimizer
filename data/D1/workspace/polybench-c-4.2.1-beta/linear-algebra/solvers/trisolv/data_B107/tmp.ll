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
  br i1 %12, label %13, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %10
  br label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 2000, double* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %13
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
  %indvars.iv10 = phi i64 [ 0, %.lr.ph3 ], [ %indvars.iv.next11, %._crit_edge._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph3 ], [ %11, %._crit_edge._crit_edge ]
  %indvars.iv8 = phi i32 [ 1, %.lr.ph3 ], [ %indvars.iv.next9, %._crit_edge._crit_edge ]
  %5 = phi i32 [ 0, %.lr.ph3 ], [ %32, %._crit_edge._crit_edge ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv10
  store double -9.990000e+02, double* %6, align 8
  %7 = trunc i64 %indvars.iv10 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %3, i64 %indvars.iv10
  store double %8, double* %9, align 8
  %10 = icmp sgt i64 %indvars.iv10, -1
  %11 = add i32 %indvar, 1
  br i1 %10, label %.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %4
  br label %._crit_edge

.lr.ph:                                           ; preds = %4
  %xtraiter = and i32 %11, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %12 = add i32 %5, 2001
  %13 = sitofp i32 %12 to double
  %14 = fmul double %13, 2.000000e+00
  %15 = fdiv double %14, 2.000000e+03
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv10, i64 0
  store double %15, double* %16, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %17 = icmp eq i32 %indvar, 0
  br i1 %17, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %18 = add i32 %5, 2001
  %wide.trip.count.1 = zext i32 %indvars.iv8 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ]
  %19 = trunc i64 %indvars.iv to i32
  %20 = sub i32 %18, %19
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %23 = trunc i64 %indvars.iv.next to i32
  %24 = sub i32 %18, %23
  %25 = sitofp i32 %24 to double
  %26 = insertelement <2 x double> undef, double %21, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fmul <2 x double> %27, <double 2.000000e+00, double 2.000000e+00>
  %29 = fdiv <2 x double> %28, <double 2.000000e+03, double 2.000000e+03>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %.._crit_edge_crit_edge, %._crit_edge.loopexit
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %31 = icmp slt i64 %indvars.iv.next11, 2000
  br i1 %31, label %._crit_edge._crit_edge, label %._crit_edge4

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %indvars.iv.next9 = add i32 %indvars.iv8, 1
  %32 = add nsw i32 %5, 1
  br label %4

._crit_edge4:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]* nocapture readonly, double*, double* nocapture readonly) unnamed_addr #2 {
.lr.ph2:
  %sunkaddr = ptrtoint double* %2 to i64
  %4 = ptrtoint double* %2 to i64
  br label %5

; <label>:5:                                      ; preds = %._crit_edge._crit_edge, %.lr.ph2
  %indvars.iv10 = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next11, %._crit_edge._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph2 ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv8 = phi i32 [ 0, %.lr.ph2 ], [ %indvars.iv.next9, %._crit_edge._crit_edge ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv10
  %7 = bitcast double* %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds double, double* %2, i64 %indvars.iv10
  %10 = bitcast double* %9 to i64*
  store i64 %8, i64* %10, align 8
  %11 = icmp sgt i64 %indvars.iv10, 0
  br i1 %11, label %.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %5
  br label %._crit_edge

.lr.ph:                                           ; preds = %5
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv10, i64 0
  %13 = load double, double* %12, align 8
  %14 = load double, double* %2, align 8
  %15 = fmul double %13, %14
  %sunkaddr13 = shl i64 %indvars.iv10, 3
  %sunkaddr14 = add i64 %4, %sunkaddr13
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to double*
  %16 = load double, double* %sunkaddr15, align 8
  %17 = fsub double %16, %15
  store double %17, double* %sunkaddr15, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %18 = icmp eq i32 %indvar, 1
  br i1 %18, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv8 to i64
  %sunkaddr20 = shl i64 %indvars.iv10, 3
  %sunkaddr21 = add i64 %sunkaddr, %sunkaddr20
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to double*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = load double, double* %sunkaddr22, align 8
  %25 = fsub double %24, %23
  store double %25, double* %sunkaddr22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv.next
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  store double %31, double* %sunkaddr22, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %.._crit_edge_crit_edge, %._crit_edge.loopexit
  %32 = load double, double* %9, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv10
  %34 = load double, double* %33, align 8
  %35 = fdiv double %32, %34
  store double %35, double* %9, align 8
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %36 = icmp slt i64 %indvars.iv.next11, 2000
  br i1 %36, label %._crit_edge._crit_edge, label %._crit_edge3

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %indvar.next = add nuw i32 %indvar, 1
  %indvars.iv.next9 = add i32 %indvars.iv8, 1
  br label %5

._crit_edge3:                                     ; preds = %._crit_edge
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
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge.._crit_edge._crit_edge_crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge.._crit_edge._crit_edge_crit_edge ]
  %7 = phi %struct._IO_FILE* [ %6, %.lr.ph ], [ %17, %._crit_edge.._crit_edge._crit_edge_crit_edge ]
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %9) #4
  %11 = trunc i64 %indvars.iv to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge._crit_edge.._crit_edge_crit_edge

._crit_edge._crit_edge.._crit_edge_crit_edge:     ; preds = %._crit_edge._crit_edge
  br label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.._crit_edge_crit_edge, %14
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %16 = icmp slt i64 %indvars.iv.next, 2000
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %16, label %._crit_edge.._crit_edge._crit_edge_crit_edge, label %._crit_edge2

._crit_edge.._crit_edge._crit_edge_crit_edge:     ; preds = %._crit_edge
  br label %._crit_edge._crit_edge

._crit_edge2:                                     ; preds = %._crit_edge
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
