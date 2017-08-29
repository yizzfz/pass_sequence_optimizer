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
  tail call fastcc void @init_array(i32 2000, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_durbin(i32 2000, double* %5, double* %6)
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
  tail call fastcc void @print_array(i32 2000, double* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next.4, %._crit_edge ]
  %3 = sub nuw nsw i64 2001, %indvars.iv
  %4 = trunc i64 %3 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %5, double* %6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = sub i64 2000, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %9, double* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %11 = sub i64 1999, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %13, double* %14, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %15 = sub i64 1998, %indvars.iv
  %16 = trunc i64 %15 to i32
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %17, double* %18, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %19 = sub i64 1997, %indvars.iv
  %20 = trunc i64 %19 to i32
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.3
  store double %21, double* %22, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) unnamed_addr #0 {
  %4 = bitcast double* %2 to i8*
  %5 = alloca [2000 x double], align 16
  %6 = bitcast [2000 x double]* %5 to i8*
  %7 = load double, double* %1, align 8
  %8 = fsub double -0.000000e+00, %7
  store double %8, double* %2, align 8
  %9 = load double, double* %1, align 8
  %10 = fsub double -0.000000e+00, %9
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 0
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge12..lr.ph_crit_edge, %3
  %indvars.iv30 = phi i64 [ 1, %3 ], [ %indvars.iv.next31, %._crit_edge12..lr.ph_crit_edge ]
  %indvar = phi i64 [ 0, %3 ], [ %indvar.next, %._crit_edge12..lr.ph_crit_edge ]
  %.0314 = phi double [ %10, %3 ], [ %58, %._crit_edge12..lr.ph_crit_edge ]
  %.0413 = phi double [ 1.000000e+00, %3 ], [ %53, %._crit_edge12..lr.ph_crit_edge ]
  %12 = add i64 %indvar, 1
  %13 = shl i64 %indvar, 3
  %14 = fmul double %.0314, %.0314
  %15 = fsub double 1.000000e+00, %14
  %16 = add nsw i64 %indvars.iv30, -1
  %xtraiter = and i64 %12, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge33.prol.loopexit, label %._crit_edge33.prol.preheader

._crit_edge33.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge33.prol

._crit_edge33.prol:                               ; preds = %._crit_edge33.prol, %._crit_edge33.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge33.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge33.prol ]
  %.025.prol = phi double [ 0.000000e+00, %._crit_edge33.prol.preheader ], [ %23, %._crit_edge33.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge33.prol.preheader ], [ %prol.iter.sub, %._crit_edge33.prol ]
  %17 = sub nsw i64 %16, %indvars.iv.prol
  %18 = getelementptr inbounds double, double* %1, i64 %17
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %.025.prol, %22
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge33.prol.loopexit.unr-lcssa, label %._crit_edge33.prol, !llvm.loop !1

._crit_edge33.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge33.prol
  br label %._crit_edge33.prol.loopexit

._crit_edge33.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge33.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %23, %._crit_edge33.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge33.prol.loopexit.unr-lcssa ]
  %.025.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %23, %._crit_edge33.prol.loopexit.unr-lcssa ]
  %24 = icmp ult i64 %indvar, 3
  br i1 %24, label %.lr.ph9, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge33.prol.loopexit
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge33 ]
  %.025 = phi double [ %.025.unr, %.lr.ph.new ], [ %52, %._crit_edge33 ]
  %25 = sub nsw i64 %16, %indvars.iv
  %26 = getelementptr inbounds double, double* %1, i64 %25
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %.025, %30
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = sub nsw i64 %16, %indvars.iv.next
  %33 = getelementptr inbounds double, double* %1, i64 %32
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %31, %37
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %39 = sub nsw i64 %16, %indvars.iv.next.1
  %40 = getelementptr inbounds double, double* %1, i64 %39
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %38, %44
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %46 = sub nsw i64 %16, %indvars.iv.next.2
  %47 = getelementptr inbounds double, double* %1, i64 %46
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %45, %51
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv30
  br i1 %exitcond.3, label %.lr.ph9.unr-lcssa, label %._crit_edge33

.lr.ph9.unr-lcssa:                                ; preds = %._crit_edge33
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %._crit_edge33.prol.loopexit, %.lr.ph9.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge33.prol.loopexit ], [ %52, %.lr.ph9.unr-lcssa ]
  %53 = fmul double %.0413, %15
  %54 = getelementptr inbounds double, double* %1, i64 %indvars.iv30
  %55 = load double, double* %54, align 8
  %56 = fadd double %.lcssa, %55
  %57 = fsub double -0.000000e+00, %56
  %58 = fdiv double %57, %53
  %59 = and i64 %indvar, 1
  %lcmp.mod36 = icmp eq i64 %59, 0
  br i1 %lcmp.mod36, label %._crit_edge34.prol.preheader, label %._crit_edge34.prol.loopexit.unr-lcssa

._crit_edge34.prol.preheader:                     ; preds = %.lr.ph9
  br label %._crit_edge34.prol

._crit_edge34.prol:                               ; preds = %._crit_edge34.prol.preheader
  %60 = load double, double* %2, align 8
  %61 = getelementptr inbounds double, double* %2, i64 %16
  %62 = load double, double* %61, align 8
  %63 = fmul double %58, %62
  %64 = fadd double %60, %63
  store double %64, double* %11, align 16
  br label %._crit_edge34.prol.loopexit.unr-lcssa

._crit_edge34.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph9, %._crit_edge34.prol
  %indvars.iv18.unr.ph = phi i64 [ 1, %._crit_edge34.prol ], [ 0, %.lr.ph9 ]
  br label %._crit_edge34.prol.loopexit

._crit_edge34.prol.loopexit:                      ; preds = %._crit_edge34.prol.loopexit.unr-lcssa
  %65 = icmp eq i64 %indvar, 0
  br i1 %65, label %._crit_edge12, label %.lr.ph9.new

.lr.ph9.new:                                      ; preds = %._crit_edge34.prol.loopexit
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34, %.lr.ph9.new
  %indvars.iv18 = phi i64 [ %indvars.iv18.unr.ph, %.lr.ph9.new ], [ %indvars.iv.next19.1, %._crit_edge34 ]
  %66 = getelementptr inbounds double, double* %2, i64 %indvars.iv18
  %67 = load double, double* %66, align 8
  %68 = sub nsw i64 %16, %indvars.iv18
  %69 = getelementptr inbounds double, double* %2, i64 %68
  %70 = load double, double* %69, align 8
  %71 = fmul double %58, %70
  %72 = fadd double %67, %71
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv18
  store double %72, double* %73, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %74 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next19
  %75 = load double, double* %74, align 8
  %76 = sub nsw i64 %16, %indvars.iv.next19
  %77 = getelementptr inbounds double, double* %2, i64 %76
  %78 = load double, double* %77, align 8
  %79 = fmul double %58, %78
  %80 = fadd double %75, %79
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv.next19
  store double %80, double* %81, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %exitcond23.1 = icmp eq i64 %indvars.iv.next19.1, %indvars.iv30
  br i1 %exitcond23.1, label %._crit_edge12.unr-lcssa, label %._crit_edge34

._crit_edge12.unr-lcssa:                          ; preds = %._crit_edge34
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge34.prol.loopexit, %._crit_edge12.unr-lcssa
  %82 = add nuw nsw i64 %13, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %4, i8* nonnull %6, i64 %82, i32 8, i1 false)
  %83 = getelementptr inbounds double, double* %2, i64 %indvars.iv30
  store double %58, double* %83, align 8
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond32 = icmp eq i64 %indvar.next, 1999
  br i1 %exitcond32, label %84, label %._crit_edge12..lr.ph_crit_edge

._crit_edge12..lr.ph_crit_edge:                   ; preds = %._crit_edge12
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  br label %.lr.ph

; <label>:84:                                     ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %16, label %._crit_edge2

; <label>:16:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
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
