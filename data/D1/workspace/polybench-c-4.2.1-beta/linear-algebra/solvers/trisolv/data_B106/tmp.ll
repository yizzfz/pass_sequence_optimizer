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
  %14 = bitcast i8* %4 to double*
  tail call fastcc void @print_array(i32 2000, double* %14)
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
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.backedge, %4
  %indvars.iv5 = phi i64 [ 0, %4 ], [ %indvars.iv5.be, %.lr.ph.backedge ]
  %indvars.iv3 = phi i64 [ 1, %4 ], [ %indvars.iv3.be, %.lr.ph.backedge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv5
  store double -9.990000e+02, double* %5, align 8
  %6 = trunc i64 %indvars.iv5 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv5
  store double %7, double* %8, align 8
  %9 = add nuw nsw i64 %indvars.iv5, 2001
  %10 = and i64 %indvars.iv5, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %11 = trunc i64 %9 to i32
  %12 = sitofp i32 %11 to double
  %13 = fmul double %12, 2.000000e+00
  %14 = fdiv double %13, 2.000000e+03
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 0
  store double %14, double* %15, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %16 = icmp eq i64 %indvars.iv5, 0
  br i1 %16, label %.lr.ph.backedge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %17 = sub nuw nsw i64 %9, %indvars.iv
  %18 = trunc i64 %17 to i32
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = sub nuw nsw i64 %9, %indvars.iv.next
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %19, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fmul <2 x double> %25, <double 2.000000e+00, double 2.000000e+00>
  %27 = fdiv <2 x double> %26, <double 2.000000e+03, double 2.000000e+03>
  %28 = bitcast double* %20 to <2 x double>*
  store <2 x double> %27, <2 x double>* %28, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv3
  br i1 %exitcond.1, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 2000
  br i1 %exitcond7, label %29, label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %.prol.loopexit, %._crit_edge
  %indvars.iv5.be = phi i64 [ %indvars.iv.next6, %._crit_edge ], [ 1, %.prol.loopexit ]
  %indvars.iv3.be = add nuw nsw i64 %indvars.iv3, 1
  br label %.lr.ph

; <label>:29:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]* nocapture readonly, double*, double* nocapture readonly) unnamed_addr #2 {
  %sunkaddr = ptrtoint double* %2 to i64
  %5 = ptrtoint double* %2 to i64
  %6 = ptrtoint double* %2 to i64
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %4
  %indvars.iv12 = phi i64 [ 0, %4 ], [ %indvars.iv.next13, %._crit_edge ]
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv12
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds double, double* %2, i64 %indvars.iv12
  store double %9, double* %10, align 8
  %11 = icmp sgt i64 %indvars.iv12, 0
  br i1 %11, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %7
  %xtraiter = and i64 %indvars.iv12, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 0
  %13 = load double, double* %12, align 8
  %14 = load double, double* %2, align 8
  %15 = fmul double %13, %14
  %16 = fsub double %9, %15
  %sunkaddr16 = shl nuw nsw i64 %indvars.iv12, 3
  %sunkaddr17 = add i64 %5, %sunkaddr16
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to double*
  store double %16, double* %sunkaddr18, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %16, %.prol.preheader ], [ %9, %.lr.ph ]
  %.lcssa9.unr.ph = phi double [ %16, %.prol.preheader ], [ undef, %.lr.ph ]
  %17 = icmp eq i64 %indvars.iv12, 1
  br i1 %17, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr26 = shl i64 %indvars.iv12, 3
  %sunkaddr27 = add i64 %sunkaddr, %sunkaddr26
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to double*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %18 = phi double [ %30, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  store double %24, double* %sunkaddr28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv.next
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %24, %29
  store double %30, double* %sunkaddr28, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv12
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %7
  %.lcssa = phi double [ %9, %7 ], [ %.lcssa9.unr.ph, %.prol.loopexit ], [ %30, %._crit_edge.loopexit ]
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv12
  %32 = load double, double* %31, align 8
  %33 = fdiv double %.lcssa, %32
  %sunkaddr5 = shl nsw i64 %indvars.iv12, 3
  %sunkaddr6 = add i64 %6, %sunkaddr5
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  store double %33, double* %sunkaddr7, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond14, label %34, label %7

; <label>:34:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %8

; <label>:8:                                      ; preds = %._crit_edge, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %9 = phi %struct._IO_FILE* [ %7, %2 ], [ %18, %._crit_edge ]
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %11) #6
  %13 = trunc i64 %indvars.iv to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %8
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %19, label %8

; <label>:19:                                     ; preds = %._crit_edge
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
