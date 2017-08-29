; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
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
  tail call void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %19, %4
  %indvars.iv13 = phi i64 [ 0, %4 ], [ %indvars.iv.next14, %19 ]
  %5 = trunc i64 %indvars.iv13 to i32
  %6 = sitofp i32 %5 to double
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %._crit_edge15 ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv13
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.200000e+03
  %11 = fadd double %6, %10
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv
  store double %11, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv13
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.200000e+03
  %17 = fadd double %6, %16
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge15

; <label>:19:                                     ; preds = %._crit_edge15
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 1400
  br i1 %exitcond, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph143, label %._crit_edge110

.lr.ph143:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph143.split.us.preheader, label %.lr.ph143.split.preheader

.lr.ph143.split.preheader:                        ; preds = %.lr.ph143
  %xtraiter214 = and i32 %0, 1
  %lcmp.mod215 = icmp eq i32 %xtraiter214, 0
  br i1 %lcmp.mod215, label %.lr.ph143.split.prol.loopexit, label %.lr.ph143.split.prol

.lr.ph143.split.prol:                             ; preds = %.lr.ph143.split.preheader
  %10 = fdiv double 0.000000e+00, %2
  store double %10, double* %5, align 8
  br label %.lr.ph143.split.prol.loopexit

.lr.ph143.split.prol.loopexit:                    ; preds = %.lr.ph143.split.preheader, %.lr.ph143.split.prol
  %indvars.iv210.unr = phi i64 [ 1, %.lr.ph143.split.prol ], [ 0, %.lr.ph143.split.preheader ]
  %11 = icmp eq i32 %0, 1
  br i1 %11, label %.lr.ph136, label %.lr.ph143.split.preheader226

.lr.ph143.split.preheader226:                     ; preds = %.lr.ph143.split.prol.loopexit
  %12 = fdiv double 0.000000e+00, %2
  %wide.trip.count212.1 = zext i32 %0 to i64
  %13 = add nsw i64 %wide.trip.count212.1, -2
  %14 = sub nsw i64 %13, %indvars.iv210.unr
  %15 = lshr i64 %14, 1
  %16 = add nuw i64 %15, 1
  %min.iters.check = icmp ult i64 %16, 4
  br i1 %min.iters.check, label %.lr.ph143.split.preheader239, label %min.iters.checked

.lr.ph143.split.preheader239:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph143.split.preheader226
  %indvars.iv210.ph = phi i64 [ %indvars.iv210.unr, %min.iters.checked ], [ %indvars.iv210.unr, %.lr.ph143.split.preheader226 ], [ %ind.end, %middle.block ]
  br label %.lr.ph143.split

min.iters.checked:                                ; preds = %.lr.ph143.split.preheader226
  %n.mod.vf = and i64 %16, 3
  %n.vec = sub i64 %16, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %17 = shl nuw i64 %15, 1
  %18 = or i64 %indvars.iv210.unr, %17
  %19 = add i64 %18, 2
  %20 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %19, %20
  br i1 %cmp.zero, label %.lr.ph143.split.preheader239, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert232 = insertelement <2 x double> undef, double %12, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert232, <2 x double> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %21 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv210.unr, %21
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
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph143.split.preheader239

.lr.ph143.split.us.preheader:                     ; preds = %.lr.ph143
  %32 = add i32 %1, -1
  %xtraiter204 = and i32 %1, 3
  %lcmp.mod205 = icmp eq i32 %xtraiter204, 0
  %33 = icmp ult i32 %32, 3
  %wide.trip.count208 = zext i32 %0 to i64
  %wide.trip.count200.3 = zext i32 %1 to i64
  br label %.lr.ph143.split.us

.lr.ph143.split.us:                               ; preds = %._crit_edge140.us, %.lr.ph143.split.us.preheader
  %indvars.iv206 = phi i64 [ 0, %.lr.ph143.split.us.preheader ], [ %indvars.iv.next207, %._crit_edge140.us ]
  %34 = getelementptr inbounds double, double* %5, i64 %indvars.iv206
  store double 0.000000e+00, double* %34, align 8
  br i1 %lcmp.mod205, label %.prol.loopexit203, label %.prol.preheader202.preheader

.prol.preheader202.preheader:                     ; preds = %.lr.ph143.split.us
  br label %.prol.preheader202

.prol.preheader202:                               ; preds = %.prol.preheader202.preheader, %.prol.preheader202
  %35 = phi double [ %38, %.prol.preheader202 ], [ 0.000000e+00, %.prol.preheader202.preheader ]
  %indvars.iv198.prol = phi i64 [ %indvars.iv.next199.prol, %.prol.preheader202 ], [ 0, %.prol.preheader202.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader202 ], [ %xtraiter204, %.prol.preheader202.preheader ]
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv198.prol, i64 %indvars.iv206
  %37 = load double, double* %36, align 8
  %38 = fadd double %37, %35
  store double %38, double* %34, align 8
  %indvars.iv.next199.prol = add nuw nsw i64 %indvars.iv198.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit203.loopexit, label %.prol.preheader202, !llvm.loop !4

.prol.loopexit203.loopexit:                       ; preds = %.prol.preheader202
  br label %.prol.loopexit203

.prol.loopexit203:                                ; preds = %.prol.loopexit203.loopexit, %.lr.ph143.split.us
  %39 = phi double [ 0.000000e+00, %.lr.ph143.split.us ], [ %38, %.prol.loopexit203.loopexit ]
  %indvars.iv198.unr = phi i64 [ 0, %.lr.ph143.split.us ], [ %indvars.iv.next199.prol, %.prol.loopexit203.loopexit ]
  br i1 %33, label %._crit_edge140.us, label %.lr.ph143.split.us.new.preheader

.lr.ph143.split.us.new.preheader:                 ; preds = %.prol.loopexit203
  br label %.lr.ph143.split.us.new

.lr.ph143.split.us.new:                           ; preds = %.lr.ph143.split.us.new.preheader, %.lr.ph143.split.us.new
  %40 = phi double [ %52, %.lr.ph143.split.us.new ], [ %39, %.lr.ph143.split.us.new.preheader ]
  %indvars.iv198 = phi i64 [ %indvars.iv.next199.3, %.lr.ph143.split.us.new ], [ %indvars.iv198.unr, %.lr.ph143.split.us.new.preheader ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv198, i64 %indvars.iv206
  %42 = load double, double* %41, align 8
  %43 = fadd double %42, %40
  store double %43, double* %34, align 8
  %indvars.iv.next199 = add nuw nsw i64 %indvars.iv198, 1
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199, i64 %indvars.iv206
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %34, align 8
  %indvars.iv.next199.1 = add nsw i64 %indvars.iv198, 2
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199.1, i64 %indvars.iv206
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  store double %49, double* %34, align 8
  %indvars.iv.next199.2 = add nsw i64 %indvars.iv198, 3
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199.2, i64 %indvars.iv206
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %34, align 8
  %indvars.iv.next199.3 = add nsw i64 %indvars.iv198, 4
  %exitcond201.3 = icmp eq i64 %indvars.iv.next199.3, %wide.trip.count200.3
  br i1 %exitcond201.3, label %._crit_edge140.us.loopexit, label %.lr.ph143.split.us.new

._crit_edge140.us.loopexit:                       ; preds = %.lr.ph143.split.us.new
  br label %._crit_edge140.us

._crit_edge140.us:                                ; preds = %._crit_edge140.us.loopexit, %.prol.loopexit203
  %53 = phi double [ %39, %.prol.loopexit203 ], [ %52, %._crit_edge140.us.loopexit ]
  %54 = fdiv double %53, %2
  store double %54, double* %34, align 8
  %indvars.iv.next207 = add nuw nsw i64 %indvars.iv206, 1
  %exitcond209 = icmp eq i64 %indvars.iv.next207, %wide.trip.count208
  br i1 %exitcond209, label %._crit_edge.loopexit, label %.lr.ph143.split.us

._crit_edge.loopexit:                             ; preds = %._crit_edge140.us
  br label %._crit_edge

._crit_edge.loopexit240:                          ; preds = %.lr.ph143.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit240, %._crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph136, label %._crit_edge.._crit_edge110_crit_edge

._crit_edge.._crit_edge110_crit_edge:             ; preds = %._crit_edge
  br label %._crit_edge110

.lr.ph136:                                        ; preds = %.lr.ph143.split.prol.loopexit, %._crit_edge
  br i1 %9, label %.lr.ph136.split.us.preheader, label %.lr.ph136.split.preheader

.lr.ph136.split.preheader:                        ; preds = %.lr.ph136
  %55 = fdiv double 0.000000e+00, %2
  %wide.trip.count196 = zext i32 %0 to i64
  %xtraiter249 = and i64 %wide.trip.count196, 1
  %lcmp.mod250 = icmp eq i64 %xtraiter249, 0
  br i1 %lcmp.mod250, label %.lr.ph136.split.prol.loopexit, label %.lr.ph136.split.prol.preheader

.lr.ph136.split.prol.preheader:                   ; preds = %.lr.ph136.split.preheader
  br label %.lr.ph136.split.prol

.lr.ph136.split.prol:                             ; preds = %.lr.ph136.split.prol.preheader
  store double %55, double* %6, align 8
  %56 = tail call double @sqrt(double %55) #4
  store double %56, double* %6, align 8
  %57 = fcmp ugt double %56, 1.000000e-01
  br i1 %57, label %58, label %._crit_edge111.prol

; <label>:58:                                     ; preds = %.lr.ph136.split.prol
  br label %._crit_edge111.prol

._crit_edge111.prol:                              ; preds = %58, %.lr.ph136.split.prol
  %59 = phi double [ %56, %58 ], [ 1.000000e+00, %.lr.ph136.split.prol ]
  store double %59, double* %6, align 8
  br label %.lr.ph136.split.prol.loopexit

.lr.ph136.split.prol.loopexit:                    ; preds = %.lr.ph136.split.preheader, %._crit_edge111.prol
  %indvars.iv194.unr = phi i64 [ 0, %.lr.ph136.split.preheader ], [ 1, %._crit_edge111.prol ]
  %60 = icmp eq i32 %0, 1
  br i1 %60, label %._crit_edge110.loopexit238, label %.lr.ph136.split.preheader.new

.lr.ph136.split.preheader.new:                    ; preds = %.lr.ph136.split.prol.loopexit
  br label %.lr.ph136.split

.lr.ph136.split.us.preheader:                     ; preds = %.lr.ph136
  %xtraiter188 = and i32 %1, 1
  %lcmp.mod189 = icmp eq i32 %xtraiter188, 0
  %61 = icmp eq i32 %1, 1
  %wide.trip.count192 = zext i32 %0 to i64
  %wide.trip.count184.1 = zext i32 %1 to i64
  br label %.lr.ph136.split.us

.lr.ph136.split.us:                               ; preds = %.lr.ph136.split.us.preheader, %._crit_edge111.us
  %indvars.iv190 = phi i64 [ %indvars.iv.next191, %._crit_edge111.us ], [ 0, %.lr.ph136.split.us.preheader ]
  %62 = getelementptr inbounds double, double* %6, i64 %indvars.iv190
  store double 0.000000e+00, double* %62, align 8
  %63 = getelementptr inbounds double, double* %5, i64 %indvars.iv190
  br i1 %lcmp.mod189, label %.prol.loopexit187, label %.prol.preheader186

.prol.preheader186:                               ; preds = %.lr.ph136.split.us
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv190
  %65 = load double, double* %64, align 8
  %66 = load double, double* %63, align 8
  %67 = fsub double %65, %66
  %68 = fmul double %67, %67
  %69 = fadd double %68, 0.000000e+00
  store double %69, double* %62, align 8
  br label %.prol.loopexit187

.prol.loopexit187:                                ; preds = %.prol.preheader186, %.lr.ph136.split.us
  %70 = phi double [ %69, %.prol.preheader186 ], [ 0.000000e+00, %.lr.ph136.split.us ]
  %indvars.iv182.unr.ph = phi i64 [ 1, %.prol.preheader186 ], [ 0, %.lr.ph136.split.us ]
  br i1 %61, label %._crit_edge134.us, label %.lr.ph136.split.us.new.preheader

.lr.ph136.split.us.new.preheader:                 ; preds = %.prol.loopexit187
  br label %.lr.ph136.split.us.new

; <label>:71:                                     ; preds = %._crit_edge134.us
  br label %._crit_edge111.us

._crit_edge111.us:                                ; preds = %._crit_edge134.us, %71
  %72 = phi double [ %88, %71 ], [ 1.000000e+00, %._crit_edge134.us ]
  store double %72, double* %62, align 8
  %indvars.iv.next191 = add nuw nsw i64 %indvars.iv190, 1
  %exitcond193 = icmp eq i64 %indvars.iv.next191, %wide.trip.count192
  br i1 %exitcond193, label %._crit_edge110.loopexit, label %.lr.ph136.split.us

.lr.ph136.split.us.new:                           ; preds = %.lr.ph136.split.us.new.preheader, %.lr.ph136.split.us.new
  %73 = phi double [ %85, %.lr.ph136.split.us.new ], [ %70, %.lr.ph136.split.us.new.preheader ]
  %indvars.iv182 = phi i64 [ %indvars.iv.next183.1, %.lr.ph136.split.us.new ], [ %indvars.iv182.unr.ph, %.lr.ph136.split.us.new.preheader ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv182, i64 %indvars.iv190
  %75 = load double, double* %74, align 8
  %76 = load double, double* %63, align 8
  %77 = fsub double %75, %76
  %78 = fmul double %77, %77
  %79 = fadd double %73, %78
  store double %79, double* %62, align 8
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183, i64 %indvars.iv190
  %81 = load double, double* %80, align 8
  %82 = load double, double* %63, align 8
  %83 = fsub double %81, %82
  %84 = fmul double %83, %83
  %85 = fadd double %79, %84
  store double %85, double* %62, align 8
  %indvars.iv.next183.1 = add nsw i64 %indvars.iv182, 2
  %exitcond185.1 = icmp eq i64 %indvars.iv.next183.1, %wide.trip.count184.1
  br i1 %exitcond185.1, label %._crit_edge134.us.loopexit, label %.lr.ph136.split.us.new

._crit_edge134.us.loopexit:                       ; preds = %.lr.ph136.split.us.new
  br label %._crit_edge134.us

._crit_edge134.us:                                ; preds = %._crit_edge134.us.loopexit, %.prol.loopexit187
  %86 = phi double [ %70, %.prol.loopexit187 ], [ %85, %._crit_edge134.us.loopexit ]
  %87 = fdiv double %86, %2
  store double %87, double* %62, align 8
  %88 = tail call double @sqrt(double %87) #4
  store double %88, double* %62, align 8
  %89 = fcmp ugt double %88, 1.000000e-01
  br i1 %89, label %71, label %._crit_edge111.us

.lr.ph143.split:                                  ; preds = %.lr.ph143.split.preheader239, %.lr.ph143.split
  %indvars.iv210 = phi i64 [ %indvars.iv.next211.1, %.lr.ph143.split ], [ %indvars.iv210.ph, %.lr.ph143.split.preheader239 ]
  %90 = getelementptr inbounds double, double* %5, i64 %indvars.iv210
  store double %12, double* %90, align 8
  %indvars.iv.next211 = add nuw nsw i64 %indvars.iv210, 1
  %91 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next211
  store double %12, double* %91, align 8
  %indvars.iv.next211.1 = add nsw i64 %indvars.iv210, 2
  %exitcond213.1 = icmp eq i64 %indvars.iv.next211.1, %wide.trip.count212.1
  br i1 %exitcond213.1, label %._crit_edge.loopexit240, label %.lr.ph143.split, !llvm.loop !6

._crit_edge110.loopexit:                          ; preds = %._crit_edge111.us
  br label %._crit_edge110

._crit_edge110.loopexit238.unr-lcssa:             ; preds = %._crit_edge111.1
  br label %._crit_edge110.loopexit238

._crit_edge110.loopexit238:                       ; preds = %.lr.ph136.split.prol.loopexit, %._crit_edge110.loopexit238.unr-lcssa
  br label %._crit_edge110

._crit_edge110:                                   ; preds = %._crit_edge110.loopexit238, %._crit_edge110.loopexit, %._crit_edge.._crit_edge110_crit_edge, %7
  %92 = icmp sgt i32 %1, 0
  br i1 %92, label %._crit_edge112.lr.ph, label %._crit_edge113

._crit_edge112.lr.ph:                             ; preds = %._crit_edge110
  br i1 %8, label %._crit_edge112.us.preheader, label %._crit_edge112.lr.ph.._crit_edge121_crit_edge

._crit_edge112.lr.ph.._crit_edge121_crit_edge:    ; preds = %._crit_edge112.lr.ph
  %.pre = add nsw i32 %0, -1
  br label %._crit_edge121

._crit_edge112.us.preheader:                      ; preds = %._crit_edge112.lr.ph
  %wide.trip.count175 = zext i32 %0 to i64
  %wide.trip.count179 = zext i32 %1 to i64
  br label %._crit_edge112.us

._crit_edge112.us:                                ; preds = %._crit_edge112.us.preheader, %._crit_edge129.us
  %indvars.iv177 = phi i64 [ %indvars.iv.next178, %._crit_edge129.us ], [ 0, %._crit_edge112.us.preheader ]
  br label %._crit_edge219

._crit_edge219:                                   ; preds = %._crit_edge219, %._crit_edge112.us
  %indvars.iv173 = phi i64 [ 0, %._crit_edge112.us ], [ %indvars.iv.next174, %._crit_edge219 ]
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv173
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv177, i64 %indvars.iv173
  %96 = load double, double* %95, align 8
  %97 = fsub double %96, %94
  store double %97, double* %95, align 8
  %98 = tail call double @sqrt(double %2) #4
  %99 = getelementptr inbounds double, double* %6, i64 %indvars.iv173
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = load double, double* %95, align 8
  %103 = fdiv double %102, %101
  store double %103, double* %95, align 8
  %indvars.iv.next174 = add nuw nsw i64 %indvars.iv173, 1
  %exitcond176 = icmp eq i64 %indvars.iv.next174, %wide.trip.count175
  br i1 %exitcond176, label %._crit_edge129.us, label %._crit_edge219

._crit_edge129.us:                                ; preds = %._crit_edge219
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %exitcond180 = icmp eq i64 %indvars.iv.next178, %wide.trip.count179
  br i1 %exitcond180, label %._crit_edge113.loopexit, label %._crit_edge112.us

.lr.ph136.split:                                  ; preds = %._crit_edge111.1, %.lr.ph136.split.preheader.new
  %indvars.iv194 = phi i64 [ %indvars.iv194.unr, %.lr.ph136.split.preheader.new ], [ %indvars.iv.next195.1, %._crit_edge111.1 ]
  %104 = getelementptr inbounds double, double* %6, i64 %indvars.iv194
  store double %55, double* %104, align 8
  %105 = tail call double @sqrt(double %55) #4
  store double %105, double* %104, align 8
  %106 = fcmp ugt double %105, 1.000000e-01
  br i1 %106, label %107, label %._crit_edge111

; <label>:107:                                    ; preds = %.lr.ph136.split
  br label %._crit_edge111

._crit_edge111:                                   ; preds = %.lr.ph136.split, %107
  %108 = phi double [ %105, %107 ], [ 1.000000e+00, %.lr.ph136.split ]
  store double %108, double* %104, align 8
  %indvars.iv.next195 = add nuw nsw i64 %indvars.iv194, 1
  %109 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next195
  store double %55, double* %109, align 8
  %110 = tail call double @sqrt(double %55) #4
  store double %110, double* %109, align 8
  %111 = fcmp ugt double %110, 1.000000e-01
  br i1 %111, label %183, label %._crit_edge111.1

._crit_edge113.loopexit:                          ; preds = %._crit_edge129.us
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.loopexit, %._crit_edge110
  %112 = add nsw i32 %0, -1
  %113 = icmp sgt i32 %0, 1
  br i1 %113, label %._crit_edge114.lr.ph, label %._crit_edge121

._crit_edge114.lr.ph:                             ; preds = %._crit_edge113
  br i1 %92, label %._crit_edge114.us.preheader, label %._crit_edge114.preheader

._crit_edge114.preheader:                         ; preds = %._crit_edge114.lr.ph
  %114 = zext i32 %112 to i64
  %115 = add i32 %0, -2
  %116 = zext i32 %115 to i64
  %117 = sext i32 %0 to i64
  %wide.trip.count162.1 = zext i32 %0 to i64
  %118 = add nsw i64 %wide.trip.count162.1, -2
  br label %._crit_edge114

._crit_edge114.us.preheader:                      ; preds = %._crit_edge114.lr.ph
  %119 = sext i32 %0 to i64
  %wide.trip.count156 = zext i32 %112 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %120 = icmp eq i32 %1, 1
  %wide.trip.count152 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %._crit_edge114.us

._crit_edge114.us:                                ; preds = %._crit_edge119.us-lcssa.us.us, %._crit_edge114.us.preheader
  %indvars.iv154 = phi i64 [ 0, %._crit_edge114.us.preheader ], [ %indvars.iv.next155, %._crit_edge119.us-lcssa.us.us ]
  %indvars.iv148 = phi i64 [ 1, %._crit_edge114.us.preheader ], [ %indvars.iv.next149, %._crit_edge119.us-lcssa.us.us ]
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv154, i64 %indvars.iv154
  store double 1.000000e+00, double* %121, align 8
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %122 = icmp slt i64 %indvars.iv.next155, %119
  br i1 %122, label %.lr.ph.us.us.preheader, label %._crit_edge119.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge114.us
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv154
  br label %.lr.ph.us.us

._crit_edge119.us-lcssa.us.us.loopexit:           ; preds = %._crit_edge117.us.us
  br label %._crit_edge119.us-lcssa.us.us

._crit_edge119.us-lcssa.us.us:                    ; preds = %._crit_edge119.us-lcssa.us.us.loopexit, %._crit_edge114.us
  %exitcond157 = icmp eq i64 %indvars.iv.next155, %wide.trip.count156
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  br i1 %exitcond157, label %._crit_edge121.loopexit, label %._crit_edge114.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge117.us.us
  %indvars.iv150 = phi i64 [ %indvars.iv.next151, %._crit_edge117.us.us ], [ %indvars.iv148, %.lr.ph.us.us.preheader ]
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv154, i64 %indvars.iv150
  store double 0.000000e+00, double* %124, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %125 = load double, double* %123, align 8
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv150
  %127 = load double, double* %126, align 8
  %128 = fmul double %125, %127
  %129 = fadd double %128, 0.000000e+00
  store double %129, double* %124, align 8
  %130 = bitcast double %129 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %131 = phi i64 [ %130, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %132 = phi double [ %129, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %120, label %._crit_edge117.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge117.us.us.loopexit:                    ; preds = %.lr.ph.us.us.new
  %133 = bitcast double %149 to i64
  br label %._crit_edge117.us.us

._crit_edge117.us.us:                             ; preds = %._crit_edge117.us.us.loopexit, %.prol.loopexit
  %134 = phi i64 [ %131, %.prol.loopexit ], [ %133, %._crit_edge117.us.us.loopexit ]
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv150, i64 %indvars.iv154
  %136 = bitcast double* %135 to i64*
  store i64 %134, i64* %136, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %exitcond = icmp eq i64 %indvars.iv.next151, %wide.trip.count152
  br i1 %exitcond, label %._crit_edge119.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %137 = phi double [ %149, %.lr.ph.us.us.new ], [ %132, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv154
  %139 = load double, double* %138, align 8
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv150
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = fadd double %137, %142
  store double %143, double* %124, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv154
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv150
  %147 = load double, double* %146, align 8
  %148 = fmul double %145, %147
  %149 = fadd double %143, %148
  store double %149, double* %124, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge117.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge114:                                   ; preds = %._crit_edge119, %._crit_edge114.preheader
  %indvars.iv169 = phi i64 [ 0, %._crit_edge114.preheader ], [ %indvars.iv.next170, %._crit_edge119 ]
  %indvars.iv158 = phi i64 [ 1, %._crit_edge114.preheader ], [ %indvars.iv.next159, %._crit_edge119 ]
  %150 = sub i64 %116, %indvars.iv169
  %151 = trunc i64 %150 to i32
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv169, i64 %indvars.iv169
  store double 1.000000e+00, double* %152, align 8
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  %153 = icmp slt i64 %indvars.iv.next170, %117
  br i1 %153, label %.lr.ph118, label %._crit_edge119

.lr.ph118:                                        ; preds = %._crit_edge114
  %154 = sub i64 %114, %indvars.iv169
  %xtraiter167222 = and i64 %154, 1
  %lcmp.mod168 = icmp eq i64 %xtraiter167222, 0
  br i1 %lcmp.mod168, label %.prol.loopexit166, label %.prol.preheader165

.prol.preheader165:                               ; preds = %.lr.ph118
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv169, i64 %indvars.iv158
  store double 0.000000e+00, double* %155, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv158, i64 %indvars.iv169
  %157 = bitcast double* %156 to i64*
  store i64 0, i64* %157, align 8
  %indvars.iv.next161.prol = add nuw nsw i64 %indvars.iv158, 1
  br label %.prol.loopexit166

.prol.loopexit166:                                ; preds = %.prol.preheader165, %.lr.ph118
  %indvars.iv160.unr.ph = phi i64 [ %indvars.iv.next161.prol, %.prol.preheader165 ], [ %indvars.iv158, %.lr.ph118 ]
  %158 = icmp eq i32 %151, 0
  br i1 %158, label %._crit_edge119, label %.lr.ph118.new.preheader

.lr.ph118.new.preheader:                          ; preds = %.prol.loopexit166
  %159 = sub i64 %118, %indvars.iv160.unr.ph
  %160 = lshr i64 %159, 1
  %161 = and i64 %160, 1
  %lcmp.mod245 = icmp eq i64 %161, 0
  br i1 %lcmp.mod245, label %.lr.ph118.new.prol.preheader, label %.lr.ph118.new.prol.loopexit.unr-lcssa

.lr.ph118.new.prol.preheader:                     ; preds = %.lr.ph118.new.preheader
  br label %.lr.ph118.new.prol

.lr.ph118.new.prol:                               ; preds = %.lr.ph118.new.prol.preheader
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv169, i64 %indvars.iv160.unr.ph
  store double 0.000000e+00, double* %162, align 8
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv160.unr.ph, i64 %indvars.iv169
  %164 = bitcast double* %163 to i64*
  store i64 0, i64* %164, align 8
  %indvars.iv.next161.prol246 = add nuw nsw i64 %indvars.iv160.unr.ph, 1
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv169, i64 %indvars.iv.next161.prol246
  store double 0.000000e+00, double* %165, align 8
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next161.prol246, i64 %indvars.iv169
  %167 = bitcast double* %166 to i64*
  store i64 0, i64* %167, align 8
  %indvars.iv.next161.1.prol = add nsw i64 %indvars.iv160.unr.ph, 2
  br label %.lr.ph118.new.prol.loopexit.unr-lcssa

.lr.ph118.new.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph118.new.preheader, %.lr.ph118.new.prol
  %indvars.iv160.unr.ph247 = phi i64 [ %indvars.iv.next161.1.prol, %.lr.ph118.new.prol ], [ %indvars.iv160.unr.ph, %.lr.ph118.new.preheader ]
  br label %.lr.ph118.new.prol.loopexit

.lr.ph118.new.prol.loopexit:                      ; preds = %.lr.ph118.new.prol.loopexit.unr-lcssa
  %168 = icmp eq i64 %160, 0
  br i1 %168, label %._crit_edge119.loopexit, label %.lr.ph118.new.preheader.new

.lr.ph118.new.preheader.new:                      ; preds = %.lr.ph118.new.prol.loopexit
  br label %.lr.ph118.new

.lr.ph118.new:                                    ; preds = %.lr.ph118.new, %.lr.ph118.new.preheader.new
  %indvars.iv160 = phi i64 [ %indvars.iv160.unr.ph247, %.lr.ph118.new.preheader.new ], [ %indvars.iv.next161.1.1, %.lr.ph118.new ]
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv169, i64 %indvars.iv160
  store double 0.000000e+00, double* %169, align 8
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv160, i64 %indvars.iv169
  %171 = bitcast double* %170 to i64*
  store i64 0, i64* %171, align 8
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv169, i64 %indvars.iv.next161
  store double 0.000000e+00, double* %172, align 8
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next161, i64 %indvars.iv169
  %174 = bitcast double* %173 to i64*
  store i64 0, i64* %174, align 8
  %indvars.iv.next161.1 = add nsw i64 %indvars.iv160, 2
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv169, i64 %indvars.iv.next161.1
  store double 0.000000e+00, double* %175, align 8
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next161.1, i64 %indvars.iv169
  %177 = bitcast double* %176 to i64*
  store i64 0, i64* %177, align 8
  %indvars.iv.next161.1248 = add nsw i64 %indvars.iv160, 3
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv169, i64 %indvars.iv.next161.1248
  store double 0.000000e+00, double* %178, align 8
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next161.1248, i64 %indvars.iv169
  %180 = bitcast double* %179 to i64*
  store i64 0, i64* %180, align 8
  %indvars.iv.next161.1.1 = add nsw i64 %indvars.iv160, 4
  %exitcond163.1.1 = icmp eq i64 %indvars.iv.next161.1.1, %wide.trip.count162.1
  br i1 %exitcond163.1.1, label %._crit_edge119.loopexit.unr-lcssa, label %.lr.ph118.new

._crit_edge119.loopexit.unr-lcssa:                ; preds = %.lr.ph118.new
  br label %._crit_edge119.loopexit

._crit_edge119.loopexit:                          ; preds = %.lr.ph118.new.prol.loopexit, %._crit_edge119.loopexit.unr-lcssa
  br label %._crit_edge119

._crit_edge119:                                   ; preds = %._crit_edge119.loopexit, %.prol.loopexit166, %._crit_edge114
  %exitcond172 = icmp eq i64 %indvars.iv.next170, %114
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  br i1 %exitcond172, label %._crit_edge121.loopexit237, label %._crit_edge114

._crit_edge121.loopexit:                          ; preds = %._crit_edge119.us-lcssa.us.us
  br label %._crit_edge121

._crit_edge121.loopexit237:                       ; preds = %._crit_edge119
  br label %._crit_edge121

._crit_edge121:                                   ; preds = %._crit_edge121.loopexit237, %._crit_edge121.loopexit, %._crit_edge112.lr.ph.._crit_edge121_crit_edge, %._crit_edge113
  %.pre-phi = phi i32 [ %.pre, %._crit_edge112.lr.ph.._crit_edge121_crit_edge ], [ %112, %._crit_edge113 ], [ %112, %._crit_edge121.loopexit ], [ %112, %._crit_edge121.loopexit237 ]
  %181 = sext i32 %.pre-phi to i64
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %181, i64 %181
  store double 1.000000e+00, double* %182, align 8
  ret void

; <label>:183:                                    ; preds = %._crit_edge111
  br label %._crit_edge111.1

._crit_edge111.1:                                 ; preds = %183, %._crit_edge111
  %184 = phi double [ %110, %183 ], [ 1.000000e+00, %._crit_edge111 ]
  store double %184, double* %109, align 8
  %indvars.iv.next195.1 = add nsw i64 %indvars.iv194, 2
  %exitcond197.1 = icmp eq i64 %indvars.iv.next195.1, %wide.trip.count196
  br i1 %exitcond197.1, label %._crit_edge110.loopexit238.unr-lcssa, label %.lr.ph136.split
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge16

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge14.us, %._crit_edge.us.preheader
  %indvars.iv17 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next18, %._crit_edge14.us ]
  %9 = mul nsw i64 %indvars.iv17, %8
  br label %._crit_edge12.us._crit_edge

._crit_edge12.us._crit_edge:                      ; preds = %._crit_edge12.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge12.us ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge12.us

; <label>:14:                                     ; preds = %._crit_edge12.us._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us._crit_edge, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge14.us, label %._crit_edge12.us._crit_edge

._crit_edge14.us:                                 ; preds = %._crit_edge12.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, %wide.trip.count
  br i1 %exitcond20, label %._crit_edge16.loopexit, label %._crit_edge.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = distinct !{!6, !7, !2, !3}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
