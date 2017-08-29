; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  tail call fastcc void @init_array(double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_durbin(double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(double* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture) unnamed_addr #2 {
.lr.ph:
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.4, %._crit_edge2 ]
  %1 = trunc i64 %indvars.iv to i32
  %2 = sub nuw nsw i32 2001, %1
  %3 = sitofp i32 %2 to double
  %4 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  store double %3, double* %4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = trunc i64 %indvars.iv.next to i32
  %6 = sub nuw nsw i32 2001, %5
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next
  store double %7, double* %8, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %9 = trunc i64 %indvars.iv.next.1 to i32
  %10 = sub nuw nsw i32 2001, %9
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.1
  store double %11, double* %12, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %13 = trunc i64 %indvars.iv.next.2 to i32
  %14 = sub nuw nsw i32 2001, %13
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.2
  store double %15, double* %16, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %17 = trunc i64 %indvars.iv.next.3 to i32
  %18 = sub nuw nsw i32 2001, %17
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.3
  store double %19, double* %20, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(double* nocapture readonly, double* nocapture) unnamed_addr #2 {
.lr.ph25.preheader:
  %2 = bitcast double* %1 to i8*
  %3 = alloca [2000 x double], align 16
  %4 = bitcast [2000 x double]* %3 to i8*
  %5 = load double, double* %0, align 8
  %6 = fsub double -0.000000e+00, %5
  store double %6, double* %1, align 8
  %7 = load double, double* %0, align 8
  %8 = fsub double -0.000000e+00, %7
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 0
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge20..lr.ph_crit_edge, %.lr.ph25.preheader
  %indvars.iv44 = phi i64 [ 1, %.lr.ph25.preheader ], [ %indvars.iv.next45, %._crit_edge20..lr.ph_crit_edge ]
  %indvar = phi i64 [ 0, %.lr.ph25.preheader ], [ %indvar.next, %._crit_edge20..lr.ph_crit_edge ]
  %10 = phi double [ %8, %.lr.ph25.preheader ], [ %60, %._crit_edge20..lr.ph_crit_edge ]
  %11 = phi double [ 1.000000e+00, %.lr.ph25.preheader ], [ %55, %._crit_edge20..lr.ph_crit_edge ]
  %12 = add i64 %indvar, 1
  %13 = shl i64 %indvar, 3
  %14 = fmul double %10, %10
  %15 = fsub double 1.000000e+00, %14
  %16 = add nsw i64 %indvars.iv44, -1
  %xtraiter = and i64 %12, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge49.prol.loopexit, label %._crit_edge49.prol.preheader

._crit_edge49.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge49.prol

._crit_edge49.prol:                               ; preds = %._crit_edge49.prol, %._crit_edge49.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge49.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge49.prol ]
  %17 = phi double [ 0.000000e+00, %._crit_edge49.prol.preheader ], [ %24, %._crit_edge49.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge49.prol.preheader ], [ %prol.iter.sub, %._crit_edge49.prol ]
  %18 = sub nsw i64 %16, %indvars.iv.prol
  %19 = getelementptr inbounds double, double* %0, i64 %18
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %17, %23
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge49.prol.loopexit.unr-lcssa, label %._crit_edge49.prol, !llvm.loop !1

._crit_edge49.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge49.prol
  br label %._crit_edge49.prol.loopexit

._crit_edge49.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge49.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %24, %._crit_edge49.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge49.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %24, %._crit_edge49.prol.loopexit.unr-lcssa ]
  %25 = icmp ult i64 %indvar, 3
  br i1 %25, label %.lr.ph16, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge49.prol.loopexit
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge49 ]
  %26 = phi double [ %.unr, %.lr.ph.new ], [ %54, %._crit_edge49 ]
  %27 = sub nsw i64 %16, %indvars.iv
  %28 = getelementptr inbounds double, double* %0, i64 %27
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %26, %32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = sub nsw i64 %16, %indvars.iv.next
  %35 = getelementptr inbounds double, double* %0, i64 %34
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %33, %39
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %41 = sub nsw i64 %16, %indvars.iv.next.1
  %42 = getelementptr inbounds double, double* %0, i64 %41
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %40, %46
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %48 = sub nsw i64 %16, %indvars.iv.next.2
  %49 = getelementptr inbounds double, double* %0, i64 %48
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fadd double %47, %53
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv44
  br i1 %exitcond.3, label %.lr.ph16.unr-lcssa, label %._crit_edge49

.lr.ph16.unr-lcssa:                               ; preds = %._crit_edge49
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %._crit_edge49.prol.loopexit, %.lr.ph16.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge49.prol.loopexit ], [ %54, %.lr.ph16.unr-lcssa ]
  %55 = fmul double %11, %15
  %56 = getelementptr inbounds double, double* %0, i64 %indvars.iv44
  %57 = load double, double* %56, align 8
  %58 = fadd double %.lcssa, %57
  %59 = fsub double -0.000000e+00, %58
  %60 = fdiv double %59, %55
  %61 = and i64 %indvar, 1
  %lcmp.mod52 = icmp eq i64 %61, 0
  br i1 %lcmp.mod52, label %._crit_edge50.prol.preheader, label %._crit_edge50.prol.loopexit.unr-lcssa

._crit_edge50.prol.preheader:                     ; preds = %.lr.ph16
  br label %._crit_edge50.prol

._crit_edge50.prol:                               ; preds = %._crit_edge50.prol.preheader
  %62 = load double, double* %1, align 8
  %63 = getelementptr inbounds double, double* %1, i64 %16
  %64 = load double, double* %63, align 8
  %65 = fmul double %60, %64
  %66 = fadd double %62, %65
  store double %66, double* %9, align 16
  br label %._crit_edge50.prol.loopexit.unr-lcssa

._crit_edge50.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph16, %._crit_edge50.prol
  %indvars.iv32.unr.ph = phi i64 [ 1, %._crit_edge50.prol ], [ 0, %.lr.ph16 ]
  br label %._crit_edge50.prol.loopexit

._crit_edge50.prol.loopexit:                      ; preds = %._crit_edge50.prol.loopexit.unr-lcssa
  %67 = icmp eq i64 %indvar, 0
  br i1 %67, label %._crit_edge20, label %.lr.ph16.new

.lr.ph16.new:                                     ; preds = %._crit_edge50.prol.loopexit
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50, %.lr.ph16.new
  %indvars.iv32 = phi i64 [ %indvars.iv32.unr.ph, %.lr.ph16.new ], [ %indvars.iv.next33.1, %._crit_edge50 ]
  %68 = getelementptr inbounds double, double* %1, i64 %indvars.iv32
  %69 = load double, double* %68, align 8
  %70 = sub nsw i64 %16, %indvars.iv32
  %71 = getelementptr inbounds double, double* %1, i64 %70
  %72 = load double, double* %71, align 8
  %73 = fmul double %60, %72
  %74 = fadd double %69, %73
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv32
  store double %74, double* %75, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %76 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next33
  %77 = load double, double* %76, align 8
  %78 = sub nsw i64 %16, %indvars.iv.next33
  %79 = getelementptr inbounds double, double* %1, i64 %78
  %80 = load double, double* %79, align 8
  %81 = fmul double %60, %80
  %82 = fadd double %77, %81
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv.next33
  store double %82, double* %83, align 8
  %indvars.iv.next33.1 = add nsw i64 %indvars.iv32, 2
  %exitcond37.1 = icmp eq i64 %indvars.iv.next33.1, %indvars.iv44
  br i1 %exitcond37.1, label %._crit_edge20.unr-lcssa, label %._crit_edge50

._crit_edge20.unr-lcssa:                          ; preds = %._crit_edge50
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge50.prol.loopexit, %._crit_edge20.unr-lcssa
  %84 = add nuw nsw i64 %13, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %2, i8* nonnull %4, i64 %84, i32 8, i1 false)
  %85 = getelementptr inbounds double, double* %1, i64 %indvars.iv44
  store double %60, double* %85, align 8
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond47 = icmp eq i64 %indvar.next, 1999
  br i1 %exitcond47, label %._crit_edge26, label %._crit_edge20..lr.ph_crit_edge

._crit_edge20..lr.ph_crit_edge:                   ; preds = %._crit_edge20
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  br label %.lr.ph

._crit_edge26:                                    ; preds = %._crit_edge20
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %.lr.ph._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
