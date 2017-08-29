; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %22, %4
  %indvars.iv8 = phi i64 [ 0, %4 ], [ %indvars.iv.next9, %22 ]
  %5 = trunc i64 %indvars.iv8 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv, %indvars.iv8
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv8
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.200000e+03>
  %20 = fadd <2 x double> %8, %19
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 1400
  br i1 %exitcond, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph127, label %._crit_edge89

.lr.ph127:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph127.split.us.preheader, label %.lr.ph127.split.preheader

.lr.ph127.split.preheader:                        ; preds = %.lr.ph127
  %xtraiter198 = and i32 %0, 1
  %lcmp.mod199 = icmp eq i32 %xtraiter198, 0
  br i1 %lcmp.mod199, label %.lr.ph127.split.prol.loopexit, label %.lr.ph127.split.prol

.lr.ph127.split.prol:                             ; preds = %.lr.ph127.split.preheader
  %10 = fdiv double 0.000000e+00, %2
  store double %10, double* %5, align 8
  br label %.lr.ph127.split.prol.loopexit

.lr.ph127.split.prol.loopexit:                    ; preds = %.lr.ph127.split.preheader, %.lr.ph127.split.prol
  %indvars.iv194.unr = phi i64 [ 0, %.lr.ph127.split.preheader ], [ 1, %.lr.ph127.split.prol ]
  %11 = icmp eq i32 %0, 1
  br i1 %11, label %.lr.ph120, label %.lr.ph127.split.preheader204

.lr.ph127.split.preheader204:                     ; preds = %.lr.ph127.split.prol.loopexit
  %12 = fdiv double 0.000000e+00, %2
  %wide.trip.count196.1 = zext i32 %0 to i64
  %13 = add nsw i64 %wide.trip.count196.1, -2
  %14 = sub nsw i64 %13, %indvars.iv194.unr
  %15 = lshr i64 %14, 1
  %16 = add nuw i64 %15, 1
  %min.iters.check = icmp ult i64 %16, 4
  br i1 %min.iters.check, label %.lr.ph127.split.preheader217, label %min.iters.checked

.lr.ph127.split.preheader217:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph127.split.preheader204
  %indvars.iv194.ph = phi i64 [ %indvars.iv194.unr, %min.iters.checked ], [ %indvars.iv194.unr, %.lr.ph127.split.preheader204 ], [ %ind.end, %middle.block ]
  br label %.lr.ph127.split

min.iters.checked:                                ; preds = %.lr.ph127.split.preheader204
  %n.mod.vf = and i64 %16, 3
  %n.vec = sub i64 %16, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %17 = shl nuw i64 %15, 1
  %18 = or i64 %indvars.iv194.unr, %17
  %19 = add i64 %18, 2
  %20 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %19, %20
  br i1 %cmp.zero, label %.lr.ph127.split.preheader217, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert210 = insertelement <2 x double> undef, double %12, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert210, <2 x double> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %21 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv194.unr, %21
  %22 = or i64 %offset.idx, 4
  %23 = add nuw nsw i64 %offset.idx, 1
  %24 = add nuw nsw i64 %22, 1
  %25 = getelementptr inbounds double, double* %5, i64 %23
  %26 = getelementptr inbounds double, double* %5, i64 %24
  %27 = getelementptr double, double* %25, i64 -1
  %28 = bitcast double* %27 to <4 x double>*
  %29 = getelementptr double, double* %26, i64 -1
  %30 = bitcast double* %29 to <4 x double>*
  store <4 x double> %interleaved.vec, <4 x double>* %28, align 8
  store <4 x double> %interleaved.vec, <4 x double>* %30, align 8
  %index.next = add i64 %index, 4
  %31 = icmp eq i64 %index.next, %n.vec
  br i1 %31, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph127.split.preheader217

.lr.ph127.split.us.preheader:                     ; preds = %.lr.ph127
  %32 = add i32 %1, -1
  %xtraiter188 = and i32 %1, 3
  %lcmp.mod189 = icmp eq i32 %xtraiter188, 0
  %33 = icmp ult i32 %32, 3
  %wide.trip.count192 = zext i32 %0 to i64
  %wide.trip.count184.3 = zext i32 %1 to i64
  br label %.lr.ph127.split.us

.lr.ph127.split.us:                               ; preds = %._crit_edge124.us, %.lr.ph127.split.us.preheader
  %indvars.iv190 = phi i64 [ 0, %.lr.ph127.split.us.preheader ], [ %indvars.iv.next191, %._crit_edge124.us ]
  %34 = getelementptr inbounds double, double* %5, i64 %indvars.iv190
  store double 0.000000e+00, double* %34, align 8
  br i1 %lcmp.mod189, label %.prol.loopexit187, label %.prol.preheader186.preheader

.prol.preheader186.preheader:                     ; preds = %.lr.ph127.split.us
  br label %.prol.preheader186

.prol.preheader186:                               ; preds = %.prol.preheader186.preheader, %.prol.preheader186
  %35 = phi double [ %38, %.prol.preheader186 ], [ 0.000000e+00, %.prol.preheader186.preheader ]
  %indvars.iv182.prol = phi i64 [ %indvars.iv.next183.prol, %.prol.preheader186 ], [ 0, %.prol.preheader186.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader186 ], [ %xtraiter188, %.prol.preheader186.preheader ]
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv182.prol, i64 %indvars.iv190
  %37 = load double, double* %36, align 8
  %38 = fadd double %37, %35
  store double %38, double* %34, align 8
  %indvars.iv.next183.prol = add nuw nsw i64 %indvars.iv182.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit187.loopexit, label %.prol.preheader186, !llvm.loop !4

.prol.loopexit187.loopexit:                       ; preds = %.prol.preheader186
  br label %.prol.loopexit187

.prol.loopexit187:                                ; preds = %.prol.loopexit187.loopexit, %.lr.ph127.split.us
  %39 = phi double [ 0.000000e+00, %.lr.ph127.split.us ], [ %38, %.prol.loopexit187.loopexit ]
  %indvars.iv182.unr = phi i64 [ 0, %.lr.ph127.split.us ], [ %indvars.iv.next183.prol, %.prol.loopexit187.loopexit ]
  br i1 %33, label %._crit_edge124.us, label %.lr.ph127.split.us.new.preheader

.lr.ph127.split.us.new.preheader:                 ; preds = %.prol.loopexit187
  br label %.lr.ph127.split.us.new

.lr.ph127.split.us.new:                           ; preds = %.lr.ph127.split.us.new.preheader, %.lr.ph127.split.us.new
  %40 = phi double [ %52, %.lr.ph127.split.us.new ], [ %39, %.lr.ph127.split.us.new.preheader ]
  %indvars.iv182 = phi i64 [ %indvars.iv.next183.3, %.lr.ph127.split.us.new ], [ %indvars.iv182.unr, %.lr.ph127.split.us.new.preheader ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv182, i64 %indvars.iv190
  %42 = load double, double* %41, align 8
  %43 = fadd double %42, %40
  store double %43, double* %34, align 8
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183, i64 %indvars.iv190
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %34, align 8
  %indvars.iv.next183.1 = add nsw i64 %indvars.iv182, 2
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183.1, i64 %indvars.iv190
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  store double %49, double* %34, align 8
  %indvars.iv.next183.2 = add nsw i64 %indvars.iv182, 3
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183.2, i64 %indvars.iv190
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %34, align 8
  %indvars.iv.next183.3 = add nsw i64 %indvars.iv182, 4
  %exitcond185.3 = icmp eq i64 %indvars.iv.next183.3, %wide.trip.count184.3
  br i1 %exitcond185.3, label %._crit_edge124.us.loopexit, label %.lr.ph127.split.us.new

._crit_edge124.us.loopexit:                       ; preds = %.lr.ph127.split.us.new
  br label %._crit_edge124.us

._crit_edge124.us:                                ; preds = %._crit_edge124.us.loopexit, %.prol.loopexit187
  %53 = phi double [ %39, %.prol.loopexit187 ], [ %52, %._crit_edge124.us.loopexit ]
  %54 = fdiv double %53, %2
  store double %54, double* %34, align 8
  %indvars.iv.next191 = add nuw nsw i64 %indvars.iv190, 1
  %exitcond193 = icmp eq i64 %indvars.iv.next191, %wide.trip.count192
  br i1 %exitcond193, label %._crit_edge.loopexit, label %.lr.ph127.split.us

._crit_edge.loopexit:                             ; preds = %._crit_edge124.us
  br label %._crit_edge

._crit_edge.loopexit218:                          ; preds = %.lr.ph127.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit218, %._crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph120, label %._crit_edge.._crit_edge89_crit_edge

._crit_edge.._crit_edge89_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge89

.lr.ph120:                                        ; preds = %.lr.ph127.split.prol.loopexit, %._crit_edge
  br i1 %9, label %.lr.ph120.split.us.preheader, label %.lr.ph120.split.preheader

.lr.ph120.split.preheader:                        ; preds = %.lr.ph120
  %55 = fdiv double 0.000000e+00, %2
  %wide.trip.count180 = zext i32 %0 to i64
  %xtraiter227 = and i64 %wide.trip.count180, 1
  %lcmp.mod228 = icmp eq i64 %xtraiter227, 0
  br i1 %lcmp.mod228, label %.lr.ph120.split.prol.loopexit, label %.lr.ph120.split.prol.preheader

.lr.ph120.split.prol.preheader:                   ; preds = %.lr.ph120.split.preheader
  br label %.lr.ph120.split.prol

.lr.ph120.split.prol:                             ; preds = %.lr.ph120.split.prol.preheader
  store double %55, double* %6, align 8
  %56 = tail call double @sqrt(double %55) #4
  store double %56, double* %6, align 8
  %57 = fcmp ugt double %56, 1.000000e-01
  br i1 %57, label %58, label %._crit_edge90.prol

; <label>:58:                                     ; preds = %.lr.ph120.split.prol
  br label %._crit_edge90.prol

._crit_edge90.prol:                               ; preds = %58, %.lr.ph120.split.prol
  %59 = phi double [ %56, %58 ], [ 1.000000e+00, %.lr.ph120.split.prol ]
  store double %59, double* %6, align 8
  br label %.lr.ph120.split.prol.loopexit

.lr.ph120.split.prol.loopexit:                    ; preds = %.lr.ph120.split.preheader, %._crit_edge90.prol
  %indvars.iv178.unr = phi i64 [ 0, %.lr.ph120.split.preheader ], [ 1, %._crit_edge90.prol ]
  %60 = icmp eq i32 %0, 1
  br i1 %60, label %._crit_edge89.loopexit216, label %.lr.ph120.split.preheader.new

.lr.ph120.split.preheader.new:                    ; preds = %.lr.ph120.split.prol.loopexit
  br label %.lr.ph120.split

.lr.ph120.split.us.preheader:                     ; preds = %.lr.ph120
  %xtraiter172 = and i32 %1, 1
  %lcmp.mod173 = icmp eq i32 %xtraiter172, 0
  %61 = icmp eq i32 %1, 1
  %wide.trip.count176 = zext i32 %0 to i64
  %wide.trip.count168.1 = zext i32 %1 to i64
  br label %.lr.ph120.split.us

.lr.ph120.split.us:                               ; preds = %.lr.ph120.split.us.preheader, %._crit_edge90.us
  %indvars.iv174 = phi i64 [ %indvars.iv.next175, %._crit_edge90.us ], [ 0, %.lr.ph120.split.us.preheader ]
  %62 = getelementptr inbounds double, double* %6, i64 %indvars.iv174
  store double 0.000000e+00, double* %62, align 8
  %63 = getelementptr inbounds double, double* %5, i64 %indvars.iv174
  br i1 %lcmp.mod173, label %.prol.loopexit171, label %.prol.preheader170

.prol.preheader170:                               ; preds = %.lr.ph120.split.us
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv174
  %65 = load double, double* %64, align 8
  %66 = load double, double* %63, align 8
  %67 = fsub double %65, %66
  %68 = fmul double %67, %67
  %69 = fadd double %68, 0.000000e+00
  store double %69, double* %62, align 8
  br label %.prol.loopexit171

.prol.loopexit171:                                ; preds = %.prol.preheader170, %.lr.ph120.split.us
  %70 = phi double [ %69, %.prol.preheader170 ], [ 0.000000e+00, %.lr.ph120.split.us ]
  %indvars.iv166.unr.ph = phi i64 [ 1, %.prol.preheader170 ], [ 0, %.lr.ph120.split.us ]
  br i1 %61, label %._crit_edge118.us, label %.lr.ph120.split.us.new.preheader

.lr.ph120.split.us.new.preheader:                 ; preds = %.prol.loopexit171
  br label %.lr.ph120.split.us.new

; <label>:71:                                     ; preds = %._crit_edge118.us
  br label %._crit_edge90.us

._crit_edge90.us:                                 ; preds = %._crit_edge118.us, %71
  %72 = phi double [ %88, %71 ], [ 1.000000e+00, %._crit_edge118.us ]
  store double %72, double* %62, align 8
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %exitcond177 = icmp eq i64 %indvars.iv.next175, %wide.trip.count176
  br i1 %exitcond177, label %._crit_edge89.loopexit, label %.lr.ph120.split.us

.lr.ph120.split.us.new:                           ; preds = %.lr.ph120.split.us.new.preheader, %.lr.ph120.split.us.new
  %73 = phi double [ %85, %.lr.ph120.split.us.new ], [ %70, %.lr.ph120.split.us.new.preheader ]
  %indvars.iv166 = phi i64 [ %indvars.iv.next167.1, %.lr.ph120.split.us.new ], [ %indvars.iv166.unr.ph, %.lr.ph120.split.us.new.preheader ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv166, i64 %indvars.iv174
  %75 = load double, double* %74, align 8
  %76 = load double, double* %63, align 8
  %77 = fsub double %75, %76
  %78 = fmul double %77, %77
  %79 = fadd double %73, %78
  store double %79, double* %62, align 8
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next167, i64 %indvars.iv174
  %81 = load double, double* %80, align 8
  %82 = load double, double* %63, align 8
  %83 = fsub double %81, %82
  %84 = fmul double %83, %83
  %85 = fadd double %79, %84
  store double %85, double* %62, align 8
  %indvars.iv.next167.1 = add nsw i64 %indvars.iv166, 2
  %exitcond169.1 = icmp eq i64 %indvars.iv.next167.1, %wide.trip.count168.1
  br i1 %exitcond169.1, label %._crit_edge118.us.loopexit, label %.lr.ph120.split.us.new

._crit_edge118.us.loopexit:                       ; preds = %.lr.ph120.split.us.new
  br label %._crit_edge118.us

._crit_edge118.us:                                ; preds = %._crit_edge118.us.loopexit, %.prol.loopexit171
  %86 = phi double [ %70, %.prol.loopexit171 ], [ %85, %._crit_edge118.us.loopexit ]
  %87 = fdiv double %86, %2
  store double %87, double* %62, align 8
  %88 = tail call double @sqrt(double %87) #4
  store double %88, double* %62, align 8
  %89 = fcmp ugt double %88, 1.000000e-01
  br i1 %89, label %71, label %._crit_edge90.us

.lr.ph127.split:                                  ; preds = %.lr.ph127.split.preheader217, %.lr.ph127.split
  %indvars.iv194 = phi i64 [ %indvars.iv.next195.1, %.lr.ph127.split ], [ %indvars.iv194.ph, %.lr.ph127.split.preheader217 ]
  %90 = getelementptr inbounds double, double* %5, i64 %indvars.iv194
  store double %12, double* %90, align 8
  %indvars.iv.next195 = add nuw nsw i64 %indvars.iv194, 1
  %91 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next195
  store double %12, double* %91, align 8
  %indvars.iv.next195.1 = add nsw i64 %indvars.iv194, 2
  %exitcond197.1 = icmp eq i64 %indvars.iv.next195.1, %wide.trip.count196.1
  br i1 %exitcond197.1, label %._crit_edge.loopexit218, label %.lr.ph127.split, !llvm.loop !6

._crit_edge89.loopexit:                           ; preds = %._crit_edge90.us
  br label %._crit_edge89

._crit_edge89.loopexit216.unr-lcssa:              ; preds = %._crit_edge90.1
  br label %._crit_edge89.loopexit216

._crit_edge89.loopexit216:                        ; preds = %.lr.ph120.split.prol.loopexit, %._crit_edge89.loopexit216.unr-lcssa
  br label %._crit_edge89

._crit_edge89:                                    ; preds = %._crit_edge89.loopexit216, %._crit_edge89.loopexit, %._crit_edge.._crit_edge89_crit_edge, %7
  %92 = icmp sgt i32 %1, 0
  br i1 %92, label %._crit_edge91.lr.ph, label %._crit_edge92

._crit_edge91.lr.ph:                              ; preds = %._crit_edge89
  br i1 %8, label %._crit_edge91.us.preheader, label %._crit_edge91.lr.ph.._crit_edge103_crit_edge

._crit_edge91.lr.ph.._crit_edge103_crit_edge:     ; preds = %._crit_edge91.lr.ph
  %.pre = add nsw i32 %0, -1
  br label %._crit_edge103

._crit_edge91.us.preheader:                       ; preds = %._crit_edge91.lr.ph
  %wide.trip.count159 = zext i32 %0 to i64
  %wide.trip.count163 = zext i32 %1 to i64
  br label %._crit_edge91.us

._crit_edge91.us:                                 ; preds = %._crit_edge91.us.preheader, %._crit_edge113.us
  %indvars.iv161 = phi i64 [ %indvars.iv.next162, %._crit_edge113.us ], [ 0, %._crit_edge91.us.preheader ]
  br label %93

; <label>:93:                                     ; preds = %93, %._crit_edge91.us
  %indvars.iv157 = phi i64 [ 0, %._crit_edge91.us ], [ %indvars.iv.next158, %93 ]
  %94 = getelementptr inbounds double, double* %5, i64 %indvars.iv157
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv161, i64 %indvars.iv157
  %97 = load double, double* %96, align 8
  %98 = fsub double %97, %95
  store double %98, double* %96, align 8
  %99 = tail call double @sqrt(double %2) #4
  %100 = getelementptr inbounds double, double* %6, i64 %indvars.iv157
  %101 = load double, double* %100, align 8
  %102 = fmul double %99, %101
  %103 = load double, double* %96, align 8
  %104 = fdiv double %103, %102
  store double %104, double* %96, align 8
  %indvars.iv.next158 = add nuw nsw i64 %indvars.iv157, 1
  %exitcond160 = icmp eq i64 %indvars.iv.next158, %wide.trip.count159
  br i1 %exitcond160, label %._crit_edge113.us, label %93

._crit_edge113.us:                                ; preds = %93
  %indvars.iv.next162 = add nuw nsw i64 %indvars.iv161, 1
  %exitcond164 = icmp eq i64 %indvars.iv.next162, %wide.trip.count163
  br i1 %exitcond164, label %._crit_edge92.loopexit, label %._crit_edge91.us

.lr.ph120.split:                                  ; preds = %._crit_edge90.1, %.lr.ph120.split.preheader.new
  %indvars.iv178 = phi i64 [ %indvars.iv178.unr, %.lr.ph120.split.preheader.new ], [ %indvars.iv.next179.1, %._crit_edge90.1 ]
  %105 = getelementptr inbounds double, double* %6, i64 %indvars.iv178
  store double %55, double* %105, align 8
  %106 = tail call double @sqrt(double %55) #4
  store double %106, double* %105, align 8
  %107 = fcmp ugt double %106, 1.000000e-01
  br i1 %107, label %108, label %._crit_edge90

; <label>:108:                                    ; preds = %.lr.ph120.split
  br label %._crit_edge90

._crit_edge90:                                    ; preds = %.lr.ph120.split, %108
  %109 = phi double [ %106, %108 ], [ 1.000000e+00, %.lr.ph120.split ]
  store double %109, double* %105, align 8
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  %110 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next179
  store double %55, double* %110, align 8
  %111 = tail call double @sqrt(double %55) #4
  store double %111, double* %110, align 8
  %112 = fcmp ugt double %111, 1.000000e-01
  br i1 %112, label %184, label %._crit_edge90.1

._crit_edge92.loopexit:                           ; preds = %._crit_edge113.us
  br label %._crit_edge92

._crit_edge92:                                    ; preds = %._crit_edge92.loopexit, %._crit_edge89
  %113 = add nsw i32 %0, -1
  %114 = icmp sgt i32 %0, 1
  br i1 %114, label %.lr.ph102, label %._crit_edge103

.lr.ph102:                                        ; preds = %._crit_edge92
  br i1 %92, label %.lr.ph102.split.us.preheader, label %.lr.ph102.split.preheader

.lr.ph102.split.preheader:                        ; preds = %.lr.ph102
  %115 = zext i32 %113 to i64
  %116 = add i32 %0, -2
  %117 = zext i32 %116 to i64
  %118 = sext i32 %0 to i64
  %wide.trip.count146.1 = zext i32 %0 to i64
  %119 = add nsw i64 %wide.trip.count146.1, -2
  br label %.lr.ph102.split

.lr.ph102.split.us.preheader:                     ; preds = %.lr.ph102
  %120 = sext i32 %0 to i64
  %wide.trip.count140 = zext i32 %113 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %121 = icmp eq i32 %1, 1
  %wide.trip.count136 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph102.split.us

.lr.ph102.split.us:                               ; preds = %._crit_edge100.us-lcssa.us.us, %.lr.ph102.split.us.preheader
  %indvars.iv138 = phi i64 [ 0, %.lr.ph102.split.us.preheader ], [ %indvars.iv.next139, %._crit_edge100.us-lcssa.us.us ]
  %indvars.iv132 = phi i64 [ 1, %.lr.ph102.split.us.preheader ], [ %indvars.iv.next133, %._crit_edge100.us-lcssa.us.us ]
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %122, align 8
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %123 = icmp slt i64 %indvars.iv.next139, %120
  br i1 %123, label %.lr.ph.us.us.preheader, label %._crit_edge100.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph102.split.us
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv138
  br label %.lr.ph.us.us

._crit_edge100.us-lcssa.us.us.loopexit:           ; preds = %._crit_edge95.us.us
  br label %._crit_edge100.us-lcssa.us.us

._crit_edge100.us-lcssa.us.us:                    ; preds = %._crit_edge100.us-lcssa.us.us.loopexit, %.lr.ph102.split.us
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond141 = icmp eq i64 %indvars.iv.next139, %wide.trip.count140
  br i1 %exitcond141, label %._crit_edge103.loopexit, label %.lr.ph102.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge95.us.us
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %._crit_edge95.us.us ], [ %indvars.iv132, %.lr.ph.us.us.preheader ]
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv138, i64 %indvars.iv134
  store double 0.000000e+00, double* %125, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %126 = load double, double* %124, align 8
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv134
  %128 = load double, double* %127, align 8
  %129 = fmul double %126, %128
  %130 = fadd double %129, 0.000000e+00
  store double %130, double* %125, align 8
  %131 = bitcast double %130 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %132 = phi i64 [ %131, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %133 = phi double [ %130, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %121, label %._crit_edge95.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge95.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %134 = bitcast double %150 to i64
  br label %._crit_edge95.us.us

._crit_edge95.us.us:                              ; preds = %._crit_edge95.us.us.loopexit, %.prol.loopexit
  %135 = phi i64 [ %132, %.prol.loopexit ], [ %134, %._crit_edge95.us.us.loopexit ]
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv134, i64 %indvars.iv138
  %137 = bitcast double* %136 to i64*
  store i64 %135, i64* %137, align 8
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %exitcond = icmp eq i64 %indvars.iv.next135, %wide.trip.count136
  br i1 %exitcond, label %._crit_edge100.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %138 = phi double [ %150, %.lr.ph.us.us.new ], [ %133, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv138
  %140 = load double, double* %139, align 8
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv134
  %142 = load double, double* %141, align 8
  %143 = fmul double %140, %142
  %144 = fadd double %138, %143
  store double %144, double* %125, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv138
  %146 = load double, double* %145, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv134
  %148 = load double, double* %147, align 8
  %149 = fmul double %146, %148
  %150 = fadd double %144, %149
  store double %150, double* %125, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge95.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph102.split:                                  ; preds = %._crit_edge100, %.lr.ph102.split.preheader
  %indvars.iv153 = phi i64 [ 0, %.lr.ph102.split.preheader ], [ %indvars.iv.next154, %._crit_edge100 ]
  %indvars.iv142 = phi i64 [ 1, %.lr.ph102.split.preheader ], [ %indvars.iv.next143, %._crit_edge100 ]
  %151 = sub i64 %117, %indvars.iv153
  %152 = trunc i64 %151 to i32
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv153, i64 %indvars.iv153
  store double 1.000000e+00, double* %153, align 8
  %indvars.iv.next154 = add nuw nsw i64 %indvars.iv153, 1
  %154 = icmp slt i64 %indvars.iv.next154, %118
  br i1 %154, label %.lr.ph99, label %._crit_edge100

.lr.ph99:                                         ; preds = %.lr.ph102.split
  %155 = sub i64 %115, %indvars.iv153
  %xtraiter151200 = and i64 %155, 1
  %lcmp.mod152 = icmp eq i64 %xtraiter151200, 0
  br i1 %lcmp.mod152, label %.prol.loopexit150, label %.prol.preheader149

.prol.preheader149:                               ; preds = %.lr.ph99
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv153, i64 %indvars.iv142
  store double 0.000000e+00, double* %156, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv142, i64 %indvars.iv153
  %158 = bitcast double* %157 to i64*
  store i64 0, i64* %158, align 8
  %indvars.iv.next145.prol = add nuw nsw i64 %indvars.iv142, 1
  br label %.prol.loopexit150

.prol.loopexit150:                                ; preds = %.prol.preheader149, %.lr.ph99
  %indvars.iv144.unr.ph = phi i64 [ %indvars.iv.next145.prol, %.prol.preheader149 ], [ %indvars.iv142, %.lr.ph99 ]
  %159 = icmp eq i32 %152, 0
  br i1 %159, label %._crit_edge100, label %.lr.ph99.new.preheader

.lr.ph99.new.preheader:                           ; preds = %.prol.loopexit150
  %160 = sub i64 %119, %indvars.iv144.unr.ph
  %161 = lshr i64 %160, 1
  %162 = and i64 %161, 1
  %lcmp.mod223 = icmp eq i64 %162, 0
  br i1 %lcmp.mod223, label %.lr.ph99.new.prol.preheader, label %.lr.ph99.new.prol.loopexit.unr-lcssa

.lr.ph99.new.prol.preheader:                      ; preds = %.lr.ph99.new.preheader
  br label %.lr.ph99.new.prol

.lr.ph99.new.prol:                                ; preds = %.lr.ph99.new.prol.preheader
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv153, i64 %indvars.iv144.unr.ph
  store double 0.000000e+00, double* %163, align 8
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv144.unr.ph, i64 %indvars.iv153
  %165 = bitcast double* %164 to i64*
  store i64 0, i64* %165, align 8
  %indvars.iv.next145.prol224 = add nuw nsw i64 %indvars.iv144.unr.ph, 1
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv153, i64 %indvars.iv.next145.prol224
  store double 0.000000e+00, double* %166, align 8
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next145.prol224, i64 %indvars.iv153
  %168 = bitcast double* %167 to i64*
  store i64 0, i64* %168, align 8
  %indvars.iv.next145.1.prol = add nsw i64 %indvars.iv144.unr.ph, 2
  br label %.lr.ph99.new.prol.loopexit.unr-lcssa

.lr.ph99.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph99.new.preheader, %.lr.ph99.new.prol
  %indvars.iv144.unr.ph225 = phi i64 [ %indvars.iv.next145.1.prol, %.lr.ph99.new.prol ], [ %indvars.iv144.unr.ph, %.lr.ph99.new.preheader ]
  br label %.lr.ph99.new.prol.loopexit

.lr.ph99.new.prol.loopexit:                       ; preds = %.lr.ph99.new.prol.loopexit.unr-lcssa
  %169 = icmp eq i64 %161, 0
  br i1 %169, label %._crit_edge100.loopexit, label %.lr.ph99.new.preheader.new

.lr.ph99.new.preheader.new:                       ; preds = %.lr.ph99.new.prol.loopexit
  br label %.lr.ph99.new

.lr.ph99.new:                                     ; preds = %.lr.ph99.new, %.lr.ph99.new.preheader.new
  %indvars.iv144 = phi i64 [ %indvars.iv144.unr.ph225, %.lr.ph99.new.preheader.new ], [ %indvars.iv.next145.1.1, %.lr.ph99.new ]
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv153, i64 %indvars.iv144
  store double 0.000000e+00, double* %170, align 8
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv144, i64 %indvars.iv153
  %172 = bitcast double* %171 to i64*
  store i64 0, i64* %172, align 8
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv153, i64 %indvars.iv.next145
  store double 0.000000e+00, double* %173, align 8
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next145, i64 %indvars.iv153
  %175 = bitcast double* %174 to i64*
  store i64 0, i64* %175, align 8
  %indvars.iv.next145.1 = add nsw i64 %indvars.iv144, 2
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv153, i64 %indvars.iv.next145.1
  store double 0.000000e+00, double* %176, align 8
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next145.1, i64 %indvars.iv153
  %178 = bitcast double* %177 to i64*
  store i64 0, i64* %178, align 8
  %indvars.iv.next145.1226 = add nsw i64 %indvars.iv144, 3
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv153, i64 %indvars.iv.next145.1226
  store double 0.000000e+00, double* %179, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next145.1226, i64 %indvars.iv153
  %181 = bitcast double* %180 to i64*
  store i64 0, i64* %181, align 8
  %indvars.iv.next145.1.1 = add nsw i64 %indvars.iv144, 4
  %exitcond147.1.1 = icmp eq i64 %indvars.iv.next145.1.1, %wide.trip.count146.1
  br i1 %exitcond147.1.1, label %._crit_edge100.loopexit.unr-lcssa, label %.lr.ph99.new

._crit_edge100.loopexit.unr-lcssa:                ; preds = %.lr.ph99.new
  br label %._crit_edge100.loopexit

._crit_edge100.loopexit:                          ; preds = %.lr.ph99.new.prol.loopexit, %._crit_edge100.loopexit.unr-lcssa
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge100.loopexit, %.prol.loopexit150, %.lr.ph102.split
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  %exitcond156 = icmp eq i64 %indvars.iv.next154, %115
  br i1 %exitcond156, label %._crit_edge103.loopexit215, label %.lr.ph102.split

._crit_edge103.loopexit:                          ; preds = %._crit_edge100.us-lcssa.us.us
  br label %._crit_edge103

._crit_edge103.loopexit215:                       ; preds = %._crit_edge100
  br label %._crit_edge103

._crit_edge103:                                   ; preds = %._crit_edge103.loopexit215, %._crit_edge103.loopexit, %._crit_edge91.lr.ph.._crit_edge103_crit_edge, %._crit_edge92
  %.pre-phi = phi i32 [ %.pre, %._crit_edge91.lr.ph.._crit_edge103_crit_edge ], [ %113, %._crit_edge92 ], [ %113, %._crit_edge103.loopexit ], [ %113, %._crit_edge103.loopexit215 ]
  %182 = sext i32 %.pre-phi to i64
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %182, i64 %182
  store double 1.000000e+00, double* %183, align 8
  ret void

; <label>:184:                                    ; preds = %._crit_edge90
  br label %._crit_edge90.1

._crit_edge90.1:                                  ; preds = %184, %._crit_edge90
  %185 = phi double [ %111, %184 ], [ 1.000000e+00, %._crit_edge90 ]
  store double %185, double* %110, align 8
  %indvars.iv.next179.1 = add nsw i64 %indvars.iv178, 2
  %exitcond181.1 = icmp eq i64 %indvars.iv.next179.1, %wide.trip.count180
  br i1 %exitcond181.1, label %._crit_edge89.loopexit216.unr-lcssa, label %.lr.ph120.split
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge13

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge11.us, %._crit_edge.us.preheader
  %indvars.iv14 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next15, %._crit_edge11.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge9.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge9.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge9.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge11.us, label %10

._crit_edge11.us:                                 ; preds = %._crit_edge9.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %._crit_edge.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = distinct !{!6, !7, !2, !3}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
