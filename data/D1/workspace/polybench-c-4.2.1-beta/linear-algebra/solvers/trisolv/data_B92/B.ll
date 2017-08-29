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
.lr.ph:
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %.lr.ph
  %indvars.iv39 = phi i64 [ 1, %.lr.ph ], [ %indvars.iv39.be, %.backedge.backedge ]
  %indvars.iv58 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv58.be, %.backedge.backedge ]
  %3 = getelementptr inbounds double, double* %1, i64 %indvars.iv58
  store double -9.990000e+02, double* %3, align 8
  %4 = trunc i64 %indvars.iv58 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv58
  store double %5, double* %6, align 8
  %7 = add nuw nsw i64 %indvars.iv58, 2001
  %8 = and i64 %indvars.iv58, 1
  %lcmp.mod = icmp eq i64 %8, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.backedge
  %9 = trunc i64 %7 to i32
  %10 = sitofp i32 %9 to double
  %11 = fmul double %10, 2.000000e+00
  %12 = fdiv double %11, 2.000000e+03
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv58, i64 0
  store double %12, double* %13, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.backedge
  %indvars.iv7.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.backedge ]
  %14 = icmp eq i64 %indvars.iv58, 0
  br i1 %14, label %.backedge.backedge, label %.new.preheader

.new.preheader:                                   ; preds = %.prol.loopexit
  br label %.new

.new:                                             ; preds = %.new.preheader, %.new
  %indvars.iv7 = phi i64 [ %indvars.iv.next.1, %.new ], [ %indvars.iv7.unr.ph, %.new.preheader ]
  %15 = sub nuw nsw i64 %7, %indvars.iv7
  %16 = trunc i64 %15 to i32
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv58, i64 %indvars.iv7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %19 = sub nuw nsw i64 %7, %indvars.iv.next
  %20 = trunc i64 %19 to i32
  %21 = sitofp i32 %20 to double
  %22 = insertelement <2 x double> undef, double %17, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fmul <2 x double> %23, <double 2.000000e+00, double 2.000000e+00>
  %25 = fdiv <2 x double> %24, <double 2.000000e+03, double 2.000000e+03>
  %26 = bitcast double* %18 to <2 x double>*
  store <2 x double> %25, <2 x double>* %26, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv7, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv39
  br i1 %exitcond.1, label %.unr-lcssa, label %.new

.unr-lcssa:                                       ; preds = %.new
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next6, 2000
  br i1 %exitcond10, label %._crit_edge, label %.backedge.backedge

.backedge.backedge:                               ; preds = %.prol.loopexit, %.unr-lcssa
  %indvars.iv58.be = phi i64 [ %indvars.iv.next6, %.unr-lcssa ], [ 1, %.prol.loopexit ]
  %indvars.iv39.be = add nuw nsw i64 %indvars.iv39, 1
  br label %.backedge

._crit_edge:                                      ; preds = %.unr-lcssa
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv([2000 x double]* nocapture readonly, double*, double* nocapture readonly) unnamed_addr #2 {
.lr.ph16:
  %3 = ptrtoint double* %1 to i64
  %sunkaddr = ptrtoint double* %1 to i64
  %4 = ptrtoint double* %1 to i64
  br label %5

; <label>:5:                                      ; preds = %._crit_edge, %.lr.ph16
  %indvars.iv314 = phi i64 [ 0, %.lr.ph16 ], [ %indvars.iv.next4, %._crit_edge ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv314
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv314
  store double %7, double* %8, align 8
  %exitcond12 = icmp eq i64 %indvars.iv314, 0
  br i1 %exitcond12, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %5
  %xtraiter = and i64 %indvars.iv314, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv314, i64 0
  %10 = load double, double* %9, align 8
  %11 = load double, double* %1, align 8
  %12 = fmul double %10, %11
  %13 = fsub double %7, %12
  %sunkaddr21.prol = shl i64 %indvars.iv314, 3
  %sunkaddr22.prol = add i64 %4, %sunkaddr21.prol
  %sunkaddr23.prol = inttoptr i64 %sunkaddr22.prol to double*
  store double %13, double* %sunkaddr23.prol, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %.lcssa24.unr.ph = phi double [ %13, %.prol.preheader ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %13, %.prol.preheader ], [ %7, %.lr.ph ]
  %indvars.iv13.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %14 = icmp eq i64 %indvars.iv314, 1
  br i1 %14, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr2 = shl i64 %indvars.iv314, 3
  %sunkaddr3 = add i64 %sunkaddr, %sunkaddr2
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to double*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %15 = phi double [ %27, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %indvars.iv13 = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv13.unr.ph, %.lr.ph.new.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv314, i64 %indvars.iv13
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv13
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %15, %20
  store double %21, double* %sunkaddr4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv314, i64 %indvars.iv.next
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %sunkaddr4, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv13, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv314
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %5
  %.lcssa = phi double [ %7, %5 ], [ %.lcssa24.unr.ph, %.prol.loopexit ], [ %27, %._crit_edge.loopexit ]
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv314, i64 %indvars.iv314
  %29 = load double, double* %28, align 8
  %30 = fdiv double %.lcssa, %29
  %sunkaddr9 = shl i64 %indvars.iv314, 3
  %sunkaddr10 = add i64 %3, %sunkaddr9
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to double*
  store double %30, double* %sunkaddr11, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv314, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond20, label %._crit_edge17, label %5

._crit_edge17:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph.preheader
  %6 = phi %struct._IO_FILE* [ %15, %._crit_edge ], [ %5, %.lr.ph.preheader ]
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %7 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %8 = load double, double* %7, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %8) #6
  %10 = trunc i64 %indvars.iv1 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %.lr.ph
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %13
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge3, label %.lr.ph

._crit_edge3:                                     ; preds = %._crit_edge
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #5
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
