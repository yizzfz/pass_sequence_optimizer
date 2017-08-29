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
  br i1 %7, label %8, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %8
  br label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 2000, double* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture) unnamed_addr #2 {
.lr.ph:
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.._crit_edge3_crit_edge, %.lr.ph
  %indvars.iv1 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.4, %._crit_edge3.._crit_edge3_crit_edge ]
  %2 = sub nuw nsw i64 2001, %indvars.iv1
  %3 = trunc i64 %2 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  store double %4, double* %5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %6 = sub i64 2000, %indvars.iv1
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %8, double* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv1, 2
  %10 = sub i64 1999, %indvars.iv1
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %12, double* %13, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv1, 3
  %14 = sub i64 1998, %indvars.iv1
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %16, double* %17, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv1, 4
  %18 = sub i64 1997, %indvars.iv1
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.3
  store double %20, double* %21, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv1, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge2, label %._crit_edge3.._crit_edge3_crit_edge

._crit_edge3.._crit_edge3_crit_edge:              ; preds = %._crit_edge3
  br label %._crit_edge3

._crit_edge2:                                     ; preds = %._crit_edge3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) unnamed_addr #2 {
.lr.ph.preheader:
  %3 = bitcast double* %2 to i8*
  %4 = alloca [2000 x double], align 16
  %5 = bitcast [2000 x double]* %4 to i8*
  %6 = load double, double* %1, align 8
  %7 = fsub double -0.000000e+00, %6
  store double %7, double* %2, align 8
  %8 = load double, double* %1, align 8
  %9 = fsub double -0.000000e+00, %8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.loopexit..lr.ph_crit_edge, %.lr.ph.preheader
  %indvar = phi i64 [ %54, %.loopexit..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %10 = phi double [ %63, %.loopexit..lr.ph_crit_edge ], [ %9, %.lr.ph.preheader ]
  %11 = phi double [ %58, %.loopexit..lr.ph_crit_edge ], [ 1.000000e+00, %.lr.ph.preheader ]
  %indvars.iv2133 = phi i64 [ %indvars.iv.next22, %.loopexit..lr.ph_crit_edge ], [ 1, %.lr.ph.preheader ]
  %12 = add i64 %indvar, 1
  %13 = shl i64 %indvar, 3
  %14 = add nsw i64 %indvars.iv2133, -1
  %xtraiter = and i64 %12, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.._crit_edge40.prol.loopexit_crit_edge, label %._crit_edge40.prol.preheader

.lr.ph.._crit_edge40.prol.loopexit_crit_edge:     ; preds = %.lr.ph
  br label %._crit_edge40.prol.loopexit

._crit_edge40.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge40.prol

._crit_edge40.prol:                               ; preds = %._crit_edge40.prol.._crit_edge40.prol_crit_edge, %._crit_edge40.prol.preheader
  %15 = phi double [ 0.000000e+00, %._crit_edge40.prol.preheader ], [ %22, %._crit_edge40.prol.._crit_edge40.prol_crit_edge ]
  %indvars.iv26.prol = phi i64 [ 0, %._crit_edge40.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge40.prol.._crit_edge40.prol_crit_edge ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge40.prol.preheader ], [ %prol.iter.sub, %._crit_edge40.prol.._crit_edge40.prol_crit_edge ]
  %16 = sub nsw i64 %14, %indvars.iv26.prol
  %17 = getelementptr inbounds double, double* %1, i64 %16
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv26.prol
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %15, %21
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv26.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge40.prol.loopexit.unr-lcssa, label %._crit_edge40.prol.._crit_edge40.prol_crit_edge, !llvm.loop !1

._crit_edge40.prol.._crit_edge40.prol_crit_edge:  ; preds = %._crit_edge40.prol
  br label %._crit_edge40.prol

._crit_edge40.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge40.prol
  br label %._crit_edge40.prol.loopexit

._crit_edge40.prol.loopexit:                      ; preds = %.lr.ph.._crit_edge40.prol.loopexit_crit_edge, %._crit_edge40.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph.._crit_edge40.prol.loopexit_crit_edge ], [ %22, %._crit_edge40.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph.._crit_edge40.prol.loopexit_crit_edge ], [ %22, %._crit_edge40.prol.loopexit.unr-lcssa ]
  %indvars.iv26.unr = phi i64 [ 0, %.lr.ph.._crit_edge40.prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %._crit_edge40.prol.loopexit.unr-lcssa ]
  %23 = icmp ult i64 %indvar, 3
  br i1 %23, label %._crit_edge40.prol.loopexit._crit_edge, label %.lr.ph.new

._crit_edge40.prol.loopexit._crit_edge:           ; preds = %._crit_edge40.prol.loopexit
  br label %53

.lr.ph.new:                                       ; preds = %._crit_edge40.prol.loopexit
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.._crit_edge40_crit_edge, %.lr.ph.new
  %24 = phi double [ %.unr, %.lr.ph.new ], [ %52, %._crit_edge40.._crit_edge40_crit_edge ]
  %indvars.iv26 = phi i64 [ %indvars.iv26.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge40.._crit_edge40_crit_edge ]
  %25 = sub nsw i64 %14, %indvars.iv26
  %26 = getelementptr inbounds double, double* %1, i64 %25
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv26
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %24, %30
  %indvars.iv.next = add nuw nsw i64 %indvars.iv26, 1
  %32 = sub nsw i64 %14, %indvars.iv.next
  %33 = getelementptr inbounds double, double* %1, i64 %32
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %31, %37
  %indvars.iv.next.1 = add nsw i64 %indvars.iv26, 2
  %39 = sub nsw i64 %14, %indvars.iv.next.1
  %40 = getelementptr inbounds double, double* %1, i64 %39
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %38, %44
  %indvars.iv.next.2 = add nsw i64 %indvars.iv26, 3
  %46 = sub nsw i64 %14, %indvars.iv.next.2
  %47 = getelementptr inbounds double, double* %1, i64 %46
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %45, %51
  %indvars.iv.next.3 = add nsw i64 %indvars.iv26, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv2133
  br i1 %exitcond.3, label %.unr-lcssa, label %._crit_edge40.._crit_edge40_crit_edge

._crit_edge40.._crit_edge40_crit_edge:            ; preds = %._crit_edge40
  br label %._crit_edge40

.unr-lcssa:                                       ; preds = %._crit_edge40
  br label %53

; <label>:53:                                     ; preds = %._crit_edge40.prol.loopexit._crit_edge, %.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge40.prol.loopexit._crit_edge ], [ %52, %.unr-lcssa ]
  %54 = add nuw nsw i64 %indvar, 1
  %55 = add nuw nsw i64 %13, 8
  %56 = fmul double %10, %10
  %57 = fsub double 1.000000e+00, %56
  %58 = fmul double %11, %57
  %59 = getelementptr inbounds double, double* %1, i64 %indvars.iv2133
  %60 = load double, double* %59, align 8
  %61 = fadd double %.lcssa, %60
  %62 = fsub double -0.000000e+00, %61
  %63 = fdiv double %62, %58
  %min.iters.check = icmp ult i64 %54, 4
  br i1 %min.iters.check, label %.._crit_edge41.preheader_crit_edge, label %min.iters.checked

.._crit_edge41.preheader_crit_edge:               ; preds = %53
  br label %._crit_edge41.preheader

min.iters.checked:                                ; preds = %53
  %n.vec = and i64 %54, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %min.iters.checked.._crit_edge41.preheader_crit_edge, label %vector.ph

min.iters.checked.._crit_edge41.preheader_crit_edge: ; preds = %min.iters.checked
  br label %._crit_edge41.preheader

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert48 = insertelement <2 x double> undef, double %63, i32 0
  %broadcast.splat49 = shufflevector <2 x double> %broadcast.splatinsert48, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %64 = getelementptr inbounds double, double* %2, i64 %index
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %65, align 8
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %67, align 8
  %68 = sub i64 %14, %index
  %69 = getelementptr inbounds double, double* %2, i64 %68
  %70 = getelementptr double, double* %69, i64 -1
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %71, align 8
  %reverse = shufflevector <2 x double> %wide.load45, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %72 = getelementptr double, double* %69, i64 -2
  %73 = getelementptr double, double* %72, i64 -1
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %74, align 8
  %reverse47 = shufflevector <2 x double> %wide.load46, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %75 = fmul <2 x double> %broadcast.splat49, %reverse
  %76 = fmul <2 x double> %broadcast.splat49, %reverse47
  %77 = fadd <2 x double> %wide.load, %75
  %78 = fadd <2 x double> %wide.load44, %76
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %index
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> %77, <2 x double>* %80, align 16
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  store <2 x double> %78, <2 x double>* %82, align 16
  %index.next = add i64 %index, 4
  %83 = icmp eq i64 %index.next, %n.vec
  br i1 %83, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %54, %n.vec
  br i1 %cmp.n, label %middle.block..loopexit_crit_edge, label %middle.block.._crit_edge41.preheader_crit_edge

middle.block.._crit_edge41.preheader_crit_edge:   ; preds = %middle.block
  br label %._crit_edge41.preheader

middle.block..loopexit_crit_edge:                 ; preds = %middle.block
  br label %.loopexit

._crit_edge41.preheader:                          ; preds = %middle.block.._crit_edge41.preheader_crit_edge, %min.iters.checked.._crit_edge41.preheader_crit_edge, %.._crit_edge41.preheader_crit_edge
  %indvars.iv929.ph = phi i64 [ 0, %min.iters.checked.._crit_edge41.preheader_crit_edge ], [ 0, %.._crit_edge41.preheader_crit_edge ], [ %n.vec, %middle.block.._crit_edge41.preheader_crit_edge ]
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.._crit_edge41_crit_edge, %._crit_edge41.preheader
  %indvars.iv929 = phi i64 [ %indvars.iv.next10, %._crit_edge41.._crit_edge41_crit_edge ], [ %indvars.iv929.ph, %._crit_edge41.preheader ]
  %84 = getelementptr inbounds double, double* %2, i64 %indvars.iv929
  %85 = load double, double* %84, align 8
  %86 = sub i64 %14, %indvars.iv929
  %87 = getelementptr inbounds double, double* %2, i64 %86
  %88 = load double, double* %87, align 8
  %89 = fmul double %63, %88
  %90 = fadd double %85, %89
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %indvars.iv929
  store double %90, double* %91, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv929, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next10, %indvars.iv2133
  br i1 %exitcond14, label %.loopexit.loopexit, label %._crit_edge41.._crit_edge41_crit_edge, !llvm.loop !6

._crit_edge41.._crit_edge41_crit_edge:            ; preds = %._crit_edge41
  br label %._crit_edge41

.loopexit.loopexit:                               ; preds = %._crit_edge41
  br label %.loopexit

.loopexit:                                        ; preds = %middle.block..loopexit_crit_edge, %.loopexit.loopexit
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %3, i8* nonnull %5, i64 %55, i32 8, i1 false)
  %92 = getelementptr inbounds double, double* %2, i64 %indvars.iv2133
  store double %63, double* %92, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2133, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond38, label %._crit_edge39, label %.loopexit..lr.ph_crit_edge

.loopexit..lr.ph_crit_edge:                       ; preds = %.loopexit
  br label %.lr.ph

._crit_edge39:                                    ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %.lr.ph.preheader
  %6 = phi i32 [ %15, %._crit_edge..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %._crit_edge..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %.lr.ph.._crit_edge_crit_edge

.lr.ph.._crit_edge_crit_edge:                     ; preds = %.lr.ph
  br label %._crit_edge

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.._crit_edge_crit_edge, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  %15 = trunc i64 %indvars.iv.next to i32
  br i1 %exitcond, label %._crit_edge4, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  br label %.lr.ph

._crit_edge4:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
