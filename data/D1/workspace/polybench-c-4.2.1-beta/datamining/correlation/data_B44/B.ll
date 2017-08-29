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
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
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
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %20, %2
  %indvars.iv9 = phi i64 [ 0, %2 ], [ %indvars.iv.next10, %20 ]
  %3 = trunc i64 %indvars.iv9 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv9
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %6, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1400
  br i1 %exitcond11, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph128, label %._crit_edge90

.lr.ph128:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph128.split.us.preheader, label %.lr.ph128.split.preheader

.lr.ph128.split.preheader:                        ; preds = %.lr.ph128
  %10 = zext i32 %0 to i64
  %xtraiter200 = and i64 %10, 1
  %lcmp.mod201 = icmp eq i64 %xtraiter200, 0
  br i1 %lcmp.mod201, label %.lr.ph128.split.prol.loopexit, label %.lr.ph128.split.prol.preheader

.lr.ph128.split.prol.preheader:                   ; preds = %.lr.ph128.split.preheader
  %11 = fdiv double 0.000000e+00, %2
  store double %11, double* %5, align 8
  br label %.lr.ph128.split.prol.loopexit

.lr.ph128.split.prol.loopexit:                    ; preds = %.lr.ph128.split.preheader, %.lr.ph128.split.prol.preheader
  %indvars.iv184.unr = phi i64 [ 0, %.lr.ph128.split.preheader ], [ 1, %.lr.ph128.split.prol.preheader ]
  %12 = icmp eq i32 %0, 1
  br i1 %12, label %.lr.ph121, label %.lr.ph128.split.preheader204

.lr.ph128.split.preheader204:                     ; preds = %.lr.ph128.split.prol.loopexit
  %13 = fdiv double 0.000000e+00, %2
  %14 = add nsw i64 %10, -2
  %15 = sub nsw i64 %14, %indvars.iv184.unr
  %16 = lshr i64 %15, 1
  %17 = add nuw i64 %16, 1
  %min.iters.check = icmp ult i64 %17, 4
  br i1 %min.iters.check, label %.lr.ph128.split.preheader221, label %min.iters.checked

.lr.ph128.split.preheader221:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph128.split.preheader204
  %indvars.iv184.ph = phi i64 [ %indvars.iv184.unr, %min.iters.checked ], [ %indvars.iv184.unr, %.lr.ph128.split.preheader204 ], [ %ind.end, %middle.block ]
  br label %.lr.ph128.split

min.iters.checked:                                ; preds = %.lr.ph128.split.preheader204
  %n.mod.vf = and i64 %17, 3
  %n.vec = sub i64 %17, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %18 = shl nuw i64 %16, 1
  %19 = or i64 %indvars.iv184.unr, %18
  %20 = add i64 %19, 2
  %21 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %20, %21
  br i1 %cmp.zero, label %.lr.ph128.split.preheader221, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert216 = insertelement <2 x double> undef, double %13, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert216, <2 x double> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %22 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv184.unr, %22
  %23 = or i64 %offset.idx, 4
  %24 = add nuw nsw i64 %offset.idx, 1
  %25 = add nuw nsw i64 %23, 1
  %26 = getelementptr inbounds double, double* %5, i64 %24
  %27 = getelementptr inbounds double, double* %5, i64 %25
  %28 = getelementptr double, double* %26, i64 -1
  %29 = bitcast double* %28 to <4 x double>*
  %30 = getelementptr double, double* %27, i64 -1
  %31 = bitcast double* %30 to <4 x double>*
  store <4 x double> %interleaved.vec, <4 x double>* %29, align 8
  store <4 x double> %interleaved.vec, <4 x double>* %31, align 8
  %index.next = add i64 %index, 4
  %32 = icmp eq i64 %index.next, %n.vec
  br i1 %32, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.lr.ph121, label %.lr.ph128.split.preheader221

.lr.ph128.split.us.preheader:                     ; preds = %.lr.ph128
  %33 = zext i32 %1 to i64
  %34 = add nsw i64 %33, -1
  %xtraiter198 = and i64 %33, 3
  %lcmp.mod199 = icmp eq i64 %xtraiter198, 0
  %35 = icmp ult i64 %34, 3
  %wide.trip.count182 = zext i32 %0 to i64
  br label %.lr.ph128.split.us

.lr.ph128.split.us:                               ; preds = %._crit_edge125.us, %.lr.ph128.split.us.preheader
  %indvars.iv180 = phi i64 [ 0, %.lr.ph128.split.us.preheader ], [ %indvars.iv.next181, %._crit_edge125.us ]
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv180
  store double 0.000000e+00, double* %36, align 8
  br i1 %lcmp.mod199, label %.prol.loopexit197, label %.prol.preheader196.preheader

.prol.preheader196.preheader:                     ; preds = %.lr.ph128.split.us
  br label %.prol.preheader196

.prol.preheader196:                               ; preds = %.prol.preheader196.preheader, %.prol.preheader196
  %37 = phi double [ %40, %.prol.preheader196 ], [ 0.000000e+00, %.prol.preheader196.preheader ]
  %indvars.iv176.prol = phi i64 [ %indvars.iv.next177.prol, %.prol.preheader196 ], [ 0, %.prol.preheader196.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader196 ], [ %xtraiter198, %.prol.preheader196.preheader ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv176.prol, i64 %indvars.iv180
  %39 = load double, double* %38, align 8
  %40 = fadd double %39, %37
  store double %40, double* %36, align 8
  %indvars.iv.next177.prol = add nuw nsw i64 %indvars.iv176.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit197.loopexit, label %.prol.preheader196, !llvm.loop !4

.prol.loopexit197.loopexit:                       ; preds = %.prol.preheader196
  br label %.prol.loopexit197

.prol.loopexit197:                                ; preds = %.prol.loopexit197.loopexit, %.lr.ph128.split.us
  %41 = phi double [ 0.000000e+00, %.lr.ph128.split.us ], [ %40, %.prol.loopexit197.loopexit ]
  %indvars.iv176.unr = phi i64 [ 0, %.lr.ph128.split.us ], [ %indvars.iv.next177.prol, %.prol.loopexit197.loopexit ]
  br i1 %35, label %._crit_edge125.us, label %.lr.ph128.split.us.new.preheader

.lr.ph128.split.us.new.preheader:                 ; preds = %.prol.loopexit197
  br label %.lr.ph128.split.us.new

.lr.ph128.split.us.new:                           ; preds = %.lr.ph128.split.us.new.preheader, %.lr.ph128.split.us.new
  %42 = phi double [ %54, %.lr.ph128.split.us.new ], [ %41, %.lr.ph128.split.us.new.preheader ]
  %indvars.iv176 = phi i64 [ %indvars.iv.next177.3, %.lr.ph128.split.us.new ], [ %indvars.iv176.unr, %.lr.ph128.split.us.new.preheader ]
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv176, i64 %indvars.iv180
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %36, align 8
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next177, i64 %indvars.iv180
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %45
  store double %48, double* %36, align 8
  %indvars.iv.next177.1 = add nsw i64 %indvars.iv176, 2
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next177.1, i64 %indvars.iv180
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  store double %51, double* %36, align 8
  %indvars.iv.next177.2 = add nsw i64 %indvars.iv176, 3
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next177.2, i64 %indvars.iv180
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %36, align 8
  %indvars.iv.next177.3 = add nsw i64 %indvars.iv176, 4
  %exitcond179.3 = icmp eq i64 %indvars.iv.next177.3, %33
  br i1 %exitcond179.3, label %._crit_edge125.us.loopexit, label %.lr.ph128.split.us.new

._crit_edge125.us.loopexit:                       ; preds = %.lr.ph128.split.us.new
  br label %._crit_edge125.us

._crit_edge125.us:                                ; preds = %._crit_edge125.us.loopexit, %.prol.loopexit197
  %55 = phi double [ %41, %.prol.loopexit197 ], [ %54, %._crit_edge125.us.loopexit ]
  %56 = fdiv double %55, %2
  store double %56, double* %36, align 8
  %indvars.iv.next181 = add nuw nsw i64 %indvars.iv180, 1
  %exitcond183 = icmp eq i64 %indvars.iv.next181, %wide.trip.count182
  br i1 %exitcond183, label %.lr.ph121.loopexit, label %.lr.ph128.split.us

.lr.ph121.loopexit:                               ; preds = %._crit_edge125.us
  br label %.lr.ph121

.lr.ph121.loopexit222:                            ; preds = %.lr.ph128.split
  br label %.lr.ph121

.lr.ph121:                                        ; preds = %.lr.ph121.loopexit222, %.lr.ph121.loopexit, %.lr.ph128.split.prol.loopexit, %middle.block
  br i1 %9, label %.lr.ph121.split.us.preheader, label %.lr.ph121.split.preheader

.lr.ph121.split.preheader:                        ; preds = %.lr.ph121
  %57 = fdiv double 0.000000e+00, %2
  %wide.trip.count174 = zext i32 %0 to i64
  %58 = add nsw i64 %wide.trip.count174, -1
  %xtraiter231 = and i64 %wide.trip.count174, 3
  %lcmp.mod232 = icmp eq i64 %xtraiter231, 0
  br i1 %lcmp.mod232, label %.lr.ph121.split.prol.loopexit, label %.lr.ph121.split.prol.preheader

.lr.ph121.split.prol.preheader:                   ; preds = %.lr.ph121.split.preheader
  br label %.lr.ph121.split.prol

.lr.ph121.split.prol:                             ; preds = %.lr.ph121.split.prol, %.lr.ph121.split.prol.preheader
  %indvars.iv172.prol = phi i64 [ %indvars.iv.next173.prol, %.lr.ph121.split.prol ], [ 0, %.lr.ph121.split.prol.preheader ]
  %prol.iter233 = phi i64 [ %prol.iter233.sub, %.lr.ph121.split.prol ], [ %xtraiter231, %.lr.ph121.split.prol.preheader ]
  %59 = getelementptr inbounds double, double* %6, i64 %indvars.iv172.prol
  store double %57, double* %59, align 8
  %60 = tail call double @sqrt(double %57) #4
  %61 = fcmp ugt double %60, 1.000000e-01
  %62 = select i1 %61, double %60, double 1.000000e+00
  store double %62, double* %59, align 8
  %indvars.iv.next173.prol = add nuw nsw i64 %indvars.iv172.prol, 1
  %prol.iter233.sub = add i64 %prol.iter233, -1
  %prol.iter233.cmp = icmp eq i64 %prol.iter233.sub, 0
  br i1 %prol.iter233.cmp, label %.lr.ph121.split.prol.loopexit.unr-lcssa, label %.lr.ph121.split.prol, !llvm.loop !6

.lr.ph121.split.prol.loopexit.unr-lcssa:          ; preds = %.lr.ph121.split.prol
  br label %.lr.ph121.split.prol.loopexit

.lr.ph121.split.prol.loopexit:                    ; preds = %.lr.ph121.split.preheader, %.lr.ph121.split.prol.loopexit.unr-lcssa
  %indvars.iv172.unr = phi i64 [ 0, %.lr.ph121.split.preheader ], [ %indvars.iv.next173.prol, %.lr.ph121.split.prol.loopexit.unr-lcssa ]
  %63 = icmp ult i64 %58, 3
  br i1 %63, label %._crit_edge90.loopexit220, label %.lr.ph121.split.preheader.new

.lr.ph121.split.preheader.new:                    ; preds = %.lr.ph121.split.prol.loopexit
  br label %.lr.ph121.split

.lr.ph121.split.us.preheader:                     ; preds = %.lr.ph121
  %64 = zext i32 %1 to i64
  %xtraiter194 = and i64 %64, 1
  %lcmp.mod195 = icmp eq i64 %xtraiter194, 0
  %65 = icmp eq i32 %1, 1
  %wide.trip.count170 = zext i32 %0 to i64
  br label %.lr.ph121.split.us

.lr.ph121.split.us:                               ; preds = %._crit_edge119.us, %.lr.ph121.split.us.preheader
  %indvars.iv168 = phi i64 [ 0, %.lr.ph121.split.us.preheader ], [ %indvars.iv.next169, %._crit_edge119.us ]
  %66 = getelementptr inbounds double, double* %6, i64 %indvars.iv168
  store double 0.000000e+00, double* %66, align 8
  %67 = getelementptr inbounds double, double* %5, i64 %indvars.iv168
  br i1 %lcmp.mod195, label %.prol.loopexit193.unr-lcssa, label %.prol.preheader192

.prol.preheader192:                               ; preds = %.lr.ph121.split.us
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv168
  %69 = load double, double* %68, align 8
  %70 = load double, double* %67, align 8
  %71 = fsub double %69, %70
  %72 = fmul double %71, %71
  %73 = fadd double %72, 0.000000e+00
  store double %73, double* %66, align 8
  br label %.prol.loopexit193.unr-lcssa

.prol.loopexit193.unr-lcssa:                      ; preds = %.lr.ph121.split.us, %.prol.preheader192
  %74 = phi double [ %73, %.prol.preheader192 ], [ 0.000000e+00, %.lr.ph121.split.us ]
  %indvars.iv164.unr.ph = phi i64 [ 1, %.prol.preheader192 ], [ 0, %.lr.ph121.split.us ]
  br i1 %65, label %._crit_edge119.us, label %.lr.ph121.split.us.new.preheader

.lr.ph121.split.us.new.preheader:                 ; preds = %.prol.loopexit193.unr-lcssa
  br label %.lr.ph121.split.us.new

.lr.ph121.split.us.new:                           ; preds = %.lr.ph121.split.us.new.preheader, %.lr.ph121.split.us.new
  %75 = phi double [ %87, %.lr.ph121.split.us.new ], [ %74, %.lr.ph121.split.us.new.preheader ]
  %indvars.iv164 = phi i64 [ %indvars.iv.next165.1, %.lr.ph121.split.us.new ], [ %indvars.iv164.unr.ph, %.lr.ph121.split.us.new.preheader ]
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv164, i64 %indvars.iv168
  %77 = load double, double* %76, align 8
  %78 = load double, double* %67, align 8
  %79 = fsub double %77, %78
  %80 = fmul double %79, %79
  %81 = fadd double %75, %80
  store double %81, double* %66, align 8
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next165, i64 %indvars.iv168
  %83 = load double, double* %82, align 8
  %84 = load double, double* %67, align 8
  %85 = fsub double %83, %84
  %86 = fmul double %85, %85
  %87 = fadd double %81, %86
  store double %87, double* %66, align 8
  %indvars.iv.next165.1 = add nsw i64 %indvars.iv164, 2
  %exitcond167.1 = icmp eq i64 %indvars.iv.next165.1, %64
  br i1 %exitcond167.1, label %._crit_edge119.us.loopexit, label %.lr.ph121.split.us.new

._crit_edge119.us.loopexit:                       ; preds = %.lr.ph121.split.us.new
  br label %._crit_edge119.us

._crit_edge119.us:                                ; preds = %._crit_edge119.us.loopexit, %.prol.loopexit193.unr-lcssa
  %88 = phi double [ %74, %.prol.loopexit193.unr-lcssa ], [ %87, %._crit_edge119.us.loopexit ]
  %89 = fdiv double %88, %2
  store double %89, double* %66, align 8
  %90 = tail call double @sqrt(double %89) #4
  %91 = fcmp ugt double %90, 1.000000e-01
  %92 = select i1 %91, double %90, double 1.000000e+00
  store double %92, double* %66, align 8
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %exitcond171 = icmp eq i64 %indvars.iv.next169, %wide.trip.count170
  br i1 %exitcond171, label %._crit_edge90.loopexit, label %.lr.ph121.split.us

.lr.ph128.split:                                  ; preds = %.lr.ph128.split.preheader221, %.lr.ph128.split
  %indvars.iv184 = phi i64 [ %indvars.iv.next185.1, %.lr.ph128.split ], [ %indvars.iv184.ph, %.lr.ph128.split.preheader221 ]
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv184
  store double %13, double* %93, align 8
  %indvars.iv.next185 = add nuw nsw i64 %indvars.iv184, 1
  %94 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next185
  store double %13, double* %94, align 8
  %indvars.iv.next185.1 = add nsw i64 %indvars.iv184, 2
  %exitcond187.1 = icmp eq i64 %indvars.iv.next185.1, %10
  br i1 %exitcond187.1, label %.lr.ph121.loopexit222, label %.lr.ph128.split, !llvm.loop !7

._crit_edge90.loopexit:                           ; preds = %._crit_edge119.us
  br label %._crit_edge90

._crit_edge90.loopexit220.unr-lcssa:              ; preds = %.lr.ph121.split
  br label %._crit_edge90.loopexit220

._crit_edge90.loopexit220:                        ; preds = %.lr.ph121.split.prol.loopexit, %._crit_edge90.loopexit220.unr-lcssa
  br label %._crit_edge90

._crit_edge90:                                    ; preds = %._crit_edge90.loopexit220, %._crit_edge90.loopexit, %7
  %95 = icmp sgt i32 %1, 0
  br i1 %95, label %._crit_edge92.lr.ph, label %._crit_edge93

._crit_edge92.lr.ph:                              ; preds = %._crit_edge90
  br i1 %8, label %._crit_edge92.us.preheader, label %._crit_edge93.thread

._crit_edge92.us.preheader:                       ; preds = %._crit_edge92.lr.ph
  %wide.trip.count157 = zext i32 %0 to i64
  %wide.trip.count161 = zext i32 %1 to i64
  br label %._crit_edge92.us

._crit_edge93.thread:                             ; preds = %._crit_edge92.lr.ph
  %96 = add nsw i32 %0, -1
  br label %._crit_edge104

._crit_edge92.us:                                 ; preds = %._crit_edge92.us.preheader, %._crit_edge114.us
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %._crit_edge114.us ], [ 0, %._crit_edge92.us.preheader ]
  br label %97

; <label>:97:                                     ; preds = %97, %._crit_edge92.us
  %indvars.iv155 = phi i64 [ 0, %._crit_edge92.us ], [ %indvars.iv.next156, %97 ]
  %98 = getelementptr inbounds double, double* %5, i64 %indvars.iv155
  %99 = load double, double* %98, align 8
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv159, i64 %indvars.iv155
  %101 = load double, double* %100, align 8
  %102 = fsub double %101, %99
  store double %102, double* %100, align 8
  %103 = tail call double @sqrt(double %2) #4
  %104 = getelementptr inbounds double, double* %6, i64 %indvars.iv155
  %105 = load double, double* %104, align 8
  %106 = fmul double %103, %105
  %107 = load double, double* %100, align 8
  %108 = fdiv double %107, %106
  store double %108, double* %100, align 8
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %exitcond158 = icmp eq i64 %indvars.iv.next156, %wide.trip.count157
  br i1 %exitcond158, label %._crit_edge114.us, label %97

._crit_edge114.us:                                ; preds = %97
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %exitcond162 = icmp eq i64 %indvars.iv.next160, %wide.trip.count161
  br i1 %exitcond162, label %._crit_edge93.loopexit, label %._crit_edge92.us

.lr.ph121.split:                                  ; preds = %.lr.ph121.split, %.lr.ph121.split.preheader.new
  %indvars.iv172 = phi i64 [ %indvars.iv172.unr, %.lr.ph121.split.preheader.new ], [ %indvars.iv.next173.3, %.lr.ph121.split ]
  %109 = getelementptr inbounds double, double* %6, i64 %indvars.iv172
  store double %57, double* %109, align 8
  %110 = tail call double @sqrt(double %57) #4
  %111 = fcmp ugt double %110, 1.000000e-01
  %112 = select i1 %111, double %110, double 1.000000e+00
  store double %112, double* %109, align 8
  %indvars.iv.next173 = add nuw nsw i64 %indvars.iv172, 1
  %113 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next173
  store double %57, double* %113, align 8
  %114 = tail call double @sqrt(double %57) #4
  %115 = fcmp ugt double %114, 1.000000e-01
  %116 = select i1 %115, double %114, double 1.000000e+00
  store double %116, double* %113, align 8
  %indvars.iv.next173.1 = add nsw i64 %indvars.iv172, 2
  %117 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next173.1
  store double %57, double* %117, align 8
  %118 = tail call double @sqrt(double %57) #4
  %119 = fcmp ugt double %118, 1.000000e-01
  %120 = select i1 %119, double %118, double 1.000000e+00
  store double %120, double* %117, align 8
  %indvars.iv.next173.2 = add nsw i64 %indvars.iv172, 3
  %121 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next173.2
  store double %57, double* %121, align 8
  %122 = tail call double @sqrt(double %57) #4
  %123 = fcmp ugt double %122, 1.000000e-01
  %124 = select i1 %123, double %122, double 1.000000e+00
  store double %124, double* %121, align 8
  %indvars.iv.next173.3 = add nsw i64 %indvars.iv172, 4
  %exitcond175.3 = icmp eq i64 %indvars.iv.next173.3, %wide.trip.count174
  br i1 %exitcond175.3, label %._crit_edge90.loopexit220.unr-lcssa, label %.lr.ph121.split

._crit_edge93.loopexit:                           ; preds = %._crit_edge114.us
  br label %._crit_edge93

._crit_edge93:                                    ; preds = %._crit_edge93.loopexit, %._crit_edge90
  %125 = add nsw i32 %0, -1
  %126 = icmp sgt i32 %0, 1
  br i1 %126, label %.lr.ph103, label %._crit_edge104

.lr.ph103:                                        ; preds = %._crit_edge93
  %127 = sext i32 %0 to i64
  br i1 %95, label %.lr.ph103.split.us.preheader, label %.lr.ph103.split.preheader

.lr.ph103.split.preheader:                        ; preds = %.lr.ph103
  %128 = zext i32 %0 to i64
  %129 = add nuw nsw i64 %128, 1
  %130 = add nsw i64 %128, -2
  %wide.trip.count153 = zext i32 %125 to i64
  %131 = add nsw i64 %128, -2
  br label %.lr.ph103.split

.lr.ph103.split.us.preheader:                     ; preds = %.lr.ph103
  %132 = zext i32 %1 to i64
  %wide.trip.count142 = zext i32 %125 to i64
  %xtraiter = and i64 %132, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %133 = icmp eq i32 %1, 1
  %wide.trip.count137 = zext i32 %0 to i64
  br label %.lr.ph103.split.us

.lr.ph103.split.us:                               ; preds = %._crit_edge101.us-lcssa.us.us, %.lr.ph103.split.us.preheader
  %indvars.iv140 = phi i64 [ 0, %.lr.ph103.split.us.preheader ], [ %indvars.iv.next141, %._crit_edge101.us-lcssa.us.us ]
  %indvars.iv133 = phi i64 [ 1, %.lr.ph103.split.us.preheader ], [ %indvars.iv.next134, %._crit_edge101.us-lcssa.us.us ]
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv140, i64 %indvars.iv140
  store double 1.000000e+00, double* %134, align 8
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %135 = icmp slt i64 %indvars.iv.next141, %127
  br i1 %135, label %.lr.ph.us.us.preheader, label %._crit_edge101.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph103.split.us
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv140
  br label %.lr.ph.us.us

._crit_edge101.us-lcssa.us.us.loopexit:           ; preds = %._crit_edge96.us.us
  br label %._crit_edge101.us-lcssa.us.us

._crit_edge101.us-lcssa.us.us:                    ; preds = %._crit_edge101.us-lcssa.us.us.loopexit, %.lr.ph103.split.us
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next141, %wide.trip.count142
  br i1 %exitcond143, label %._crit_edge104.loopexit, label %.lr.ph103.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge96.us.us
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge96.us.us ], [ %indvars.iv133, %.lr.ph.us.us.preheader ]
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv140, i64 %indvars.iv135
  store double 0.000000e+00, double* %137, align 8
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %138 = load double, double* %136, align 8
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv135
  %140 = load double, double* %139, align 8
  %141 = fmul double %138, %140
  %142 = fadd double %141, 0.000000e+00
  store double %142, double* %137, align 8
  %143 = bitcast double %142 to i64
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph.us.us, %.prol.preheader
  %144 = phi i64 [ %143, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %145 = phi double [ %142, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %133, label %._crit_edge96.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit.unr-lcssa
  br label %.lr.ph.us.us.new

._crit_edge96.us.us.unr-lcssa:                    ; preds = %.lr.ph.us.us.new
  %146 = bitcast double %162 to i64
  br label %._crit_edge96.us.us

._crit_edge96.us.us:                              ; preds = %.prol.loopexit.unr-lcssa, %._crit_edge96.us.us.unr-lcssa
  %147 = phi i64 [ %144, %.prol.loopexit.unr-lcssa ], [ %146, %._crit_edge96.us.us.unr-lcssa ]
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv135, i64 %indvars.iv140
  %149 = bitcast double* %148 to i64*
  store i64 %147, i64* %149, align 8
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next136, %wide.trip.count137
  br i1 %exitcond138, label %._crit_edge101.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %150 = phi double [ %162, %.lr.ph.us.us.new ], [ %145, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv140
  %152 = load double, double* %151, align 8
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv135
  %154 = load double, double* %153, align 8
  %155 = fmul double %152, %154
  %156 = fadd double %150, %155
  store double %156, double* %137, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv140
  %158 = load double, double* %157, align 8
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv135
  %160 = load double, double* %159, align 8
  %161 = fmul double %158, %160
  %162 = fadd double %156, %161
  store double %162, double* %137, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %132
  br i1 %exitcond.1, label %._crit_edge96.us.us.unr-lcssa, label %.lr.ph.us.us.new

.lr.ph103.split:                                  ; preds = %._crit_edge101, %.lr.ph103.split.preheader
  %indvars.iv151 = phi i64 [ 0, %.lr.ph103.split.preheader ], [ %indvars.iv.next152, %._crit_edge101 ]
  %indvars.iv144 = phi i64 [ 1, %.lr.ph103.split.preheader ], [ %indvars.iv.next145, %._crit_edge101 ]
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv151
  store double 1.000000e+00, double* %163, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %164 = icmp slt i64 %indvars.iv.next152, %127
  br i1 %164, label %.lr.ph100, label %._crit_edge101

.lr.ph100:                                        ; preds = %.lr.ph103.split
  %165 = sub i64 %129, %indvars.iv151
  %xtraiter190 = and i64 %165, 1
  %lcmp.mod191 = icmp eq i64 %xtraiter190, 0
  br i1 %lcmp.mod191, label %.prol.loopexit189.unr-lcssa, label %.prol.preheader188

.prol.preheader188:                               ; preds = %.lr.ph100
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv144
  store double 0.000000e+00, double* %166, align 8
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv144, i64 %indvars.iv151
  %168 = bitcast double* %167 to i64*
  store i64 0, i64* %168, align 8
  %indvars.iv.next147.prol = add nuw nsw i64 %indvars.iv144, 1
  br label %.prol.loopexit189.unr-lcssa

.prol.loopexit189.unr-lcssa:                      ; preds = %.lr.ph100, %.prol.preheader188
  %indvars.iv146.unr.ph = phi i64 [ %indvars.iv.next147.prol, %.prol.preheader188 ], [ %indvars.iv144, %.lr.ph100 ]
  %169 = icmp eq i64 %130, %indvars.iv151
  br i1 %169, label %._crit_edge101, label %.lr.ph100.new.preheader

.lr.ph100.new.preheader:                          ; preds = %.prol.loopexit189.unr-lcssa
  %170 = sub i64 %131, %indvars.iv146.unr.ph
  %171 = lshr i64 %170, 1
  %172 = and i64 %171, 1
  %lcmp.mod227 = icmp eq i64 %172, 0
  br i1 %lcmp.mod227, label %.lr.ph100.new.prol.preheader, label %.lr.ph100.new.prol.loopexit.unr-lcssa

.lr.ph100.new.prol.preheader:                     ; preds = %.lr.ph100.new.preheader
  br label %.lr.ph100.new.prol

.lr.ph100.new.prol:                               ; preds = %.lr.ph100.new.prol.preheader
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv146.unr.ph
  store double 0.000000e+00, double* %173, align 8
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv146.unr.ph, i64 %indvars.iv151
  %175 = bitcast double* %174 to i64*
  store i64 0, i64* %175, align 8
  %indvars.iv.next147.prol228 = add nuw nsw i64 %indvars.iv146.unr.ph, 1
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv.next147.prol228
  store double 0.000000e+00, double* %176, align 8
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next147.prol228, i64 %indvars.iv151
  %178 = bitcast double* %177 to i64*
  store i64 0, i64* %178, align 8
  %indvars.iv.next147.1.prol = add nsw i64 %indvars.iv146.unr.ph, 2
  br label %.lr.ph100.new.prol.loopexit.unr-lcssa

.lr.ph100.new.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph100.new.preheader, %.lr.ph100.new.prol
  %indvars.iv146.unr.ph229 = phi i64 [ %indvars.iv.next147.1.prol, %.lr.ph100.new.prol ], [ %indvars.iv146.unr.ph, %.lr.ph100.new.preheader ]
  br label %.lr.ph100.new.prol.loopexit

.lr.ph100.new.prol.loopexit:                      ; preds = %.lr.ph100.new.prol.loopexit.unr-lcssa
  %179 = icmp eq i64 %171, 0
  br i1 %179, label %._crit_edge101.loopexit, label %.lr.ph100.new.preheader.new

.lr.ph100.new.preheader.new:                      ; preds = %.lr.ph100.new.prol.loopexit
  br label %.lr.ph100.new

.lr.ph100.new:                                    ; preds = %.lr.ph100.new, %.lr.ph100.new.preheader.new
  %indvars.iv146 = phi i64 [ %indvars.iv146.unr.ph229, %.lr.ph100.new.preheader.new ], [ %indvars.iv.next147.1.1, %.lr.ph100.new ]
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv146
  store double 0.000000e+00, double* %180, align 8
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv146, i64 %indvars.iv151
  %182 = bitcast double* %181 to i64*
  store i64 0, i64* %182, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv.next147
  store double 0.000000e+00, double* %183, align 8
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next147, i64 %indvars.iv151
  %185 = bitcast double* %184 to i64*
  store i64 0, i64* %185, align 8
  %indvars.iv.next147.1 = add nsw i64 %indvars.iv146, 2
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv.next147.1
  store double 0.000000e+00, double* %186, align 8
  %187 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next147.1, i64 %indvars.iv151
  %188 = bitcast double* %187 to i64*
  store i64 0, i64* %188, align 8
  %indvars.iv.next147.1230 = add nsw i64 %indvars.iv146, 3
  %189 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv.next147.1230
  store double 0.000000e+00, double* %189, align 8
  %190 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next147.1230, i64 %indvars.iv151
  %191 = bitcast double* %190 to i64*
  store i64 0, i64* %191, align 8
  %indvars.iv.next147.1.1 = add nsw i64 %indvars.iv146, 4
  %exitcond149.1.1 = icmp eq i64 %indvars.iv.next147.1.1, %128
  br i1 %exitcond149.1.1, label %._crit_edge101.loopexit.unr-lcssa, label %.lr.ph100.new

._crit_edge101.loopexit.unr-lcssa:                ; preds = %.lr.ph100.new
  br label %._crit_edge101.loopexit

._crit_edge101.loopexit:                          ; preds = %.lr.ph100.new.prol.loopexit, %._crit_edge101.loopexit.unr-lcssa
  br label %._crit_edge101

._crit_edge101:                                   ; preds = %._crit_edge101.loopexit, %.prol.loopexit189.unr-lcssa, %.lr.ph103.split
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next152, %wide.trip.count153
  br i1 %exitcond154, label %._crit_edge104.loopexit219, label %.lr.ph103.split

._crit_edge104.loopexit:                          ; preds = %._crit_edge101.us-lcssa.us.us
  br label %._crit_edge104

._crit_edge104.loopexit219:                       ; preds = %._crit_edge101
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %._crit_edge104.loopexit219, %._crit_edge104.loopexit, %._crit_edge93.thread, %._crit_edge93
  %192 = phi i32 [ %96, %._crit_edge93.thread ], [ %125, %._crit_edge93 ], [ %125, %._crit_edge104.loopexit ], [ %125, %._crit_edge104.loopexit219 ]
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %193, i64 %193
  store double 1.000000e+00, double* %194, align 8
  ret void
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
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge14

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge12.us, %._crit_edge.us.preheader
  %indvars.iv15 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next16, %._crit_edge12.us ]
  %9 = mul nsw i64 %indvars.iv15, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge10.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge10.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge10.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge12.us, label %10

._crit_edge12.us:                                 ; preds = %._crit_edge10.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count
  br i1 %exitcond18, label %._crit_edge14.loopexit, label %._crit_edge.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %2
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
!6 = distinct !{!6, !5}
!7 = distinct !{!7, !8, !2, !3}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
