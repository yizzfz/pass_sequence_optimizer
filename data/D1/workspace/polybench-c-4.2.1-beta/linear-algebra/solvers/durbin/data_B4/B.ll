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
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 2000, double* %6)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture) unnamed_addr #2 {
  %3 = sext i32 %0 to i64
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %5 = add nsw i32 %0, 1
  %6 = zext i32 %5 to i64
  %7 = add nsw i64 %3, -1
  %xtraiter = and i64 %3, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv6.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %8 = sub nsw i64 %6, %indvars.iv6.prol
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv6.prol
  store double %10, double* %11, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv6.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv6.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %12 = icmp ult i64 %7, 3
  br i1 %12, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv6 = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv6.unr, %.lr.ph.new.preheader ]
  %13 = sub nsw i64 %6, %indvars.iv6
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv6
  store double %15, double* %16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %17 = sub nsw i64 %6, %indvars.iv.next
  %18 = trunc i64 %17 to i32
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %19, double* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv6, 2
  %21 = sub nsw i64 %6, %indvars.iv.next.1
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %23, double* %24, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv6, 3
  %25 = sub nsw i64 %6, %indvars.iv.next.2
  %26 = trunc i64 %25 to i32
  %27 = sitofp i32 %26 to double
  %28 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %27, double* %28, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv6, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %3
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) unnamed_addr #2 {
  %4 = bitcast double* %2 to i8*
  %5 = alloca [2000 x double], align 16
  %6 = bitcast [2000 x double]* %5 to i8*
  %7 = load double, double* %1, align 8
  %8 = fsub double -0.000000e+00, %7
  store double %8, double* %2, align 8
  %9 = icmp sgt i32 %0, 1
  br i1 %9, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %10 = sext i32 %0 to i64
  %11 = load double, double* %1, align 8
  %12 = fsub double -0.000000e+00, %11
  %13 = add nsw i64 %10, -1
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 0
  br label %.lr.ph

.lr.ph:                                           ; preds = %.loopexit, %.lr.ph.preheader
  %15 = phi double [ %8, %.lr.ph.preheader ], [ %64, %.loopexit ]
  %indvar = phi i64 [ 0, %.lr.ph.preheader ], [ %19, %.loopexit ]
  %.04266 = phi double [ 1.000000e+00, %.lr.ph.preheader ], [ %59, %.loopexit ]
  %.04365 = phi double [ %12, %.lr.ph.preheader ], [ %64, %.loopexit ]
  %indvars.iv5864 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next59, %.loopexit ]
  %16 = add i64 %indvar, -1
  %17 = shl i64 %indvar, 3
  %18 = add nuw nsw i64 %17, 8
  %19 = add nuw nsw i64 %indvar, 1
  %20 = fmul double %.04365, %.04365
  %21 = add nsw i64 %indvars.iv5864, -1
  %xtraiter = and i64 %19, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %.04161.prol = phi double [ %28, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %indvars.iv60.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %22 = sub nsw i64 %21, %indvars.iv60.prol
  %23 = getelementptr inbounds double, double* %1, i64 %22
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds double, double* %2, i64 %indvars.iv60.prol
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %.04161.prol, %27
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv60.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %28, %.prol.loopexit.loopexit ]
  %.04161.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %28, %.prol.loopexit.loopexit ]
  %indvars.iv60.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %29 = icmp ult i64 %indvar, 3
  br i1 %29, label %.unr-lcssa, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %.04161 = phi double [ %57, %.lr.ph.new ], [ %.04161.unr, %.lr.ph.new.preheader ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv60.unr, %.lr.ph.new.preheader ]
  %30 = sub nsw i64 %21, %indvars.iv60
  %31 = getelementptr inbounds double, double* %1, i64 %30
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds double, double* %2, i64 %indvars.iv60
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %.04161, %35
  %indvars.iv.next = add nuw nsw i64 %indvars.iv60, 1
  %37 = sub nsw i64 %21, %indvars.iv.next
  %38 = getelementptr inbounds double, double* %1, i64 %37
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %36, %42
  %indvars.iv.next.1 = add nsw i64 %indvars.iv60, 2
  %44 = sub nsw i64 %21, %indvars.iv.next.1
  %45 = getelementptr inbounds double, double* %1, i64 %44
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %43, %49
  %indvars.iv.next.2 = add nsw i64 %indvars.iv60, 3
  %51 = sub nsw i64 %21, %indvars.iv.next.2
  %52 = getelementptr inbounds double, double* %1, i64 %51
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %50, %56
  %indvars.iv.next.3 = add nsw i64 %indvars.iv60, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv5864
  br i1 %exitcond.3, label %.unr-lcssa.loopexit, label %.lr.ph.new

.unr-lcssa.loopexit:                              ; preds = %.lr.ph.new
  br label %.unr-lcssa

.unr-lcssa:                                       ; preds = %.unr-lcssa.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %57, %.unr-lcssa.loopexit ]
  %58 = fsub double 1.000000e+00, %20
  %59 = fmul double %.04266, %58
  %60 = getelementptr inbounds double, double* %1, i64 %indvars.iv5864
  %61 = load double, double* %60, align 8
  %62 = fadd double %.lcssa, %61
  %63 = fsub double -0.000000e+00, %62
  %64 = fdiv double %63, %59
  %65 = and i64 %indvar, 1
  %lcmp.mod70 = icmp eq i64 %65, 0
  br i1 %lcmp.mod70, label %.prol.preheader67, label %.prol.loopexit68

.prol.preheader67:                                ; preds = %.unr-lcssa
  %66 = load double, double* %2, align 8
  %67 = fmul double %64, %15
  %68 = fadd double %66, %67
  store double %68, double* %14, align 16
  br label %.prol.loopexit68

.prol.loopexit68:                                 ; preds = %.prol.preheader67, %.unr-lcssa
  %indvars.iv4662.unr.ph = phi i64 [ 1, %.prol.preheader67 ], [ 0, %.unr-lcssa ]
  %69 = icmp eq i64 %indvar, 0
  br i1 %69, label %.loopexit, label %.new.preheader

.new.preheader:                                   ; preds = %.prol.loopexit68
  %70 = sub i64 %16, %indvars.iv4662.unr.ph
  %71 = lshr i64 %70, 1
  %72 = add nuw i64 %71, 1
  %min.iters.check = icmp ult i64 %72, 2
  br i1 %min.iters.check, label %.new.preheader82, label %min.iters.checked

min.iters.checked:                                ; preds = %.new.preheader
  %n.mod.vf = and i64 %72, 1
  %n.vec = sub i64 %72, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %73 = or i64 %indvars.iv4662.unr.ph, 2
  %74 = shl nuw i64 %71, 1
  %75 = add i64 %73, %74
  %76 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %75, %76
  br i1 %cmp.zero, label %.new.preheader82, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert80 = insertelement <2 x double> undef, double %64, i32 0
  %broadcast.splat81 = shufflevector <2 x double> %broadcast.splatinsert80, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %77 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv4662.unr.ph, %77
  %78 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %79 = bitcast double* %78 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %79, align 8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec75 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %80 = sub nsw i64 %21, %offset.idx
  %81 = getelementptr inbounds double, double* %2, i64 %80
  %82 = getelementptr double, double* %81, i64 -3
  %83 = bitcast double* %82 to <4 x double>*
  %wide.vec76 = load <4 x double>, <4 x double>* %83, align 8
  %strided.vec77 = shufflevector <4 x double> %wide.vec76, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x double> %strided.vec77, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %strided.vec78 = shufflevector <4 x double> %wide.vec76, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %reverse79 = shufflevector <2 x double> %strided.vec78, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %84 = fmul <2 x double> %broadcast.splat81, %reverse79
  %85 = fadd <2 x double> %strided.vec, %84
  %86 = add nuw nsw i64 %offset.idx, 1
  %87 = fmul <2 x double> %broadcast.splat81, %reverse
  %88 = fadd <2 x double> %strided.vec75, %87
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %86
  %90 = getelementptr double, double* %89, i64 -1
  %91 = bitcast double* %90 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %85, <2 x double> %88, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %91, align 8
  %index.next = add i64 %index, 2
  %92 = icmp eq i64 %index.next, %n.vec
  br i1 %92, label %middle.block, label %vector.body, !llvm.loop !4

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit, label %.new.preheader82

.new.preheader82:                                 ; preds = %middle.block, %min.iters.checked, %.new.preheader
  %indvars.iv4662.ph = phi i64 [ %indvars.iv4662.unr.ph, %min.iters.checked ], [ %indvars.iv4662.unr.ph, %.new.preheader ], [ %ind.end, %middle.block ]
  br label %.new

.new:                                             ; preds = %.new.preheader82, %.new
  %indvars.iv4662 = phi i64 [ %indvars.iv.next47.1, %.new ], [ %indvars.iv4662.ph, %.new.preheader82 ]
  %93 = getelementptr inbounds double, double* %2, i64 %indvars.iv4662
  %94 = load double, double* %93, align 8
  %95 = sub nsw i64 %21, %indvars.iv4662
  %96 = getelementptr inbounds double, double* %2, i64 %95
  %97 = load double, double* %96, align 8
  %98 = fmul double %64, %97
  %99 = fadd double %94, %98
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv4662
  store double %99, double* %100, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv4662, 1
  %101 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next47
  %102 = load double, double* %101, align 8
  %103 = sub nsw i64 %21, %indvars.iv.next47
  %104 = getelementptr inbounds double, double* %2, i64 %103
  %105 = load double, double* %104, align 8
  %106 = fmul double %64, %105
  %107 = fadd double %102, %106
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv.next47
  store double %107, double* %108, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv4662, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next47.1, %indvars.iv5864
  br i1 %exitcond51.1, label %.loopexit.loopexit, label %.new, !llvm.loop !7

.loopexit.loopexit:                               ; preds = %.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.prol.loopexit68
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* nonnull %6, i64 %18, i32 8, i1 false)
  %109 = getelementptr inbounds double, double* %2, i64 %indvars.iv5864
  store double %64, double* %109, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv5864, 1
  %exitcond = icmp eq i64 %19, %13
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
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
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %14
  %indvars.iv5 = phi i64 [ %indvars.iv.next, %14 ], [ 0, %.lr.ph.preheader ]
  %9 = trunc i64 %indvars.iv5 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %14

; <label>:14:                                     ; preds = %.lr.ph, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %14
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
