; ModuleID = 'A.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call void @print_array(i32 1000, i32 1100, [1100 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]*, [1200 x double]*, [1100 x double]*) #2 {
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader34.lr.ph, label %.preheader31

.preheader34.lr.ph:                               ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %0 to double
  br i1 %10, label %.preheader34.us.preheader, label %.preheader32.lr.ph

.preheader34.us.preheader:                        ; preds = %.preheader34.lr.ph
  %wide.trip.count68 = zext i32 %1 to i64
  %wide.trip.count72 = zext i32 %0 to i64
  br label %.preheader34.us

.preheader34.us:                                  ; preds = %.preheader34.us.preheader, %._crit_edge46.us
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge46.us ], [ 0, %.preheader34.us.preheader ]
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader34.us
  %indvars.iv66 = phi i64 [ 0, %.preheader34.us ], [ %indvars.iv.next67, %12 ]
  %13 = mul nuw nsw i64 %indvars.iv66, %indvars.iv70
  %14 = add nuw nsw i64 %13, 1
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %11
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv66
  store double %18, double* %19, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  br i1 %exitcond69, label %._crit_edge46.us, label %12

._crit_edge46.us:                                 ; preds = %12
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond73, label %.preheader33, label %.preheader34.us

.preheader33:                                     ; preds = %._crit_edge46.us
  %20 = icmp sgt i32 %0, 0
  br i1 %20, label %.preheader32.lr.ph, label %.preheader31

.preheader32.lr.ph:                               ; preds = %.preheader34.lr.ph, %.preheader33
  %21 = icmp sgt i32 %2, 0
  %22 = sitofp i32 %2 to double
  br i1 %21, label %.preheader32.us.preheader, label %._crit_edge38

.preheader32.us.preheader:                        ; preds = %.preheader32.lr.ph
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %23 = icmp eq i32 %2, 1
  %wide.trip.count63 = zext i32 %0 to i64
  %wide.trip.count59.1 = zext i32 %2 to i64
  br label %.preheader32.us

.preheader32.us:                                  ; preds = %.preheader32.us.preheader, %._crit_edge41.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge41.us ], [ 0, %.preheader32.us.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader32.us
  %24 = trunc i64 %indvars.iv61 to i32
  %25 = srem i32 %24, %2
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %22
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv61, i64 0
  store double %27, double* %28, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader32.us
  %indvars.iv57.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader32.us ]
  br i1 %23, label %._crit_edge41.us, label %.preheader32.us.new.preheader

.preheader32.us.new.preheader:                    ; preds = %.prol.loopexit
  br label %.preheader32.us.new

.preheader32.us.new:                              ; preds = %.preheader32.us.new.preheader, %.preheader32.us.new
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.1, %.preheader32.us.new ], [ %indvars.iv57.unr.ph, %.preheader32.us.new.preheader ]
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %29 = mul nuw nsw i64 %indvars.iv.next58, %indvars.iv61
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, %2
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, %22
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv61, i64 %indvars.iv57
  store double %33, double* %34, align 8
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  %35 = mul nuw nsw i64 %indvars.iv.next58.1, %indvars.iv61
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, %2
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %22
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv61, i64 %indvars.iv.next58
  store double %39, double* %40, align 8
  %exitcond60.1 = icmp eq i64 %indvars.iv.next58.1, %wide.trip.count59.1
  br i1 %exitcond60.1, label %._crit_edge41.us.loopexit, label %.preheader32.us.new

._crit_edge41.us.loopexit:                        ; preds = %.preheader32.us.new
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %._crit_edge41.us.loopexit, %.prol.loopexit
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %.preheader31.loopexit, label %.preheader32.us

.preheader31.loopexit:                            ; preds = %._crit_edge41.us
  br label %.preheader31

.preheader31:                                     ; preds = %.preheader31.loopexit, %8, %.preheader33
  %41 = icmp sgt i32 %2, 0
  br i1 %41, label %.preheader.lr.ph, label %._crit_edge38

.preheader.lr.ph:                                 ; preds = %.preheader31
  %42 = icmp sgt i32 %1, 0
  %43 = sitofp i32 %1 to double
  br i1 %42, label %.preheader.us.preheader, label %._crit_edge38

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count54 = zext i32 %2 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %44

; <label>:44:                                     ; preds = %44, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %44 ]
  %45 = add nuw nsw i64 %indvars.iv, 2
  %46 = mul nuw nsw i64 %45, %indvars.iv52
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %1
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, %43
  %51 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv52, i64 %indvars.iv
  store double %50, double* %51, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %44

._crit_edge.us:                                   ; preds = %44
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %._crit_edge38.loopexit, label %.preheader.us

._crit_edge38.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit, %.preheader32.lr.ph, %.preheader.lr.ph, %.preheader31
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]*, [1200 x double]*, [1100 x double]*) #2 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader24.lr.ph, label %._crit_edge31

.preheader24.lr.ph:                               ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  %12 = icmp sgt i32 %1, 0
  br i1 %10, label %.preheader24.us.preheader, label %.preheader24.preheader

.preheader24.preheader:                           ; preds = %.preheader24.lr.ph
  %xtraiter64 = and i32 %1, 1
  %lcmp.mod65 = icmp eq i32 %xtraiter64, 0
  %wide.trip.count68 = zext i32 %2 to i64
  %wide.trip.count60.1 = zext i32 %1 to i64
  %wide.trip.count72 = zext i32 %0 to i64
  %13 = add nsw i64 %wide.trip.count60.1, -2
  %14 = add nsw i64 %wide.trip.count60.1, -2
  %brmerge78.demorgan = and i1 %11, %12
  %broadcast.splatinsert95 = insertelement <2 x double> undef, double %3, i32 0
  br label %.preheader24

.preheader24.us.preheader:                        ; preds = %.preheader24.lr.ph
  %15 = add i32 %1, -1
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %16 = icmp ult i32 %15, 3
  %xtraiter47 = and i32 %1, 1
  %lcmp.mod48 = icmp eq i32 %xtraiter47, 0
  %17 = icmp eq i32 %15, 0
  %wide.trip.count52 = zext i32 %2 to i64
  %wide.trip.count44.1 = zext i32 %1 to i64
  %wide.trip.count55 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %1 to i64
  %18 = add nsw i64 %wide.trip.count44.1, -2
  %19 = add nsw i64 %wide.trip.count44.1, -2
  %20 = add nsw i64 %wide.trip.count44.1, -4
  %brmerge.demorgan = and i1 %11, %12
  %broadcast.splatinsert143 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splatinsert175 = insertelement <2 x double> undef, double %4, i32 0
  %broadcast.splat176 = shufflevector <2 x double> %broadcast.splatinsert175, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader24.us

.preheader24.us:                                  ; preds = %._crit_edge29.us, %.preheader24.us.preheader
  %indvars.iv53 = phi i64 [ 0, %.preheader24.us.preheader ], [ %indvars.iv.next54, %._crit_edge29.us ]
  %scevgep113 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv53, i64 2
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader24.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv.prol
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %4
  store double %23, double* %21, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader24.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader24.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %16, label %..preheader23_crit_edge.us, label %.preheader24.us.new.preheader

.preheader24.us.new.preheader:                    ; preds = %.prol.loopexit
  %24 = sub i64 %20, %indvars.iv.unr
  %25 = lshr i64 %24, 2
  %26 = add nuw nsw i64 %25, 1
  %min.iters.check155 = icmp ult i64 %26, 2
  br i1 %min.iters.check155, label %.preheader24.us.new.preheader179, label %min.iters.checked156

.preheader24.us.new.preheader179:                 ; preds = %middle.block153, %min.iters.checked156, %.preheader24.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked156 ], [ %indvars.iv.unr, %.preheader24.us.new.preheader ], [ %ind.end164, %middle.block153 ]
  br label %.preheader24.us.new

min.iters.checked156:                             ; preds = %.preheader24.us.new.preheader
  %n.mod.vf157 = and i64 %26, 1
  %n.vec158 = sub nsw i64 %26, %n.mod.vf157
  %cmp.zero159 = icmp eq i64 %n.vec158, 0
  %27 = add i64 %indvars.iv.unr, 4
  %28 = shl nuw i64 %25, 2
  %29 = add i64 %27, %28
  %30 = shl nuw nsw i64 %n.mod.vf157, 2
  %ind.end164 = sub i64 %29, %30
  br i1 %cmp.zero159, label %.preheader24.us.new.preheader179, label %vector.ph160

vector.ph160:                                     ; preds = %min.iters.checked156
  br label %vector.body152

vector.body152:                                   ; preds = %vector.body152, %vector.ph160
  %index161 = phi i64 [ 0, %vector.ph160 ], [ %index.next162, %vector.body152 ]
  %31 = shl i64 %index161, 2
  %32 = add i64 %indvars.iv.unr, %31
  %33 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv53, i64 %32
  %34 = bitcast double* %33 to <8 x double>*
  %wide.vec170 = load <8 x double>, <8 x double>* %34, align 8
  %strided.vec171 = shufflevector <8 x double> %wide.vec170, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec172 = shufflevector <8 x double> %wide.vec170, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec173 = shufflevector <8 x double> %wide.vec170, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec174 = shufflevector <8 x double> %wide.vec170, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %35 = fmul <2 x double> %strided.vec171, %broadcast.splat176
  %36 = fmul <2 x double> %strided.vec172, %broadcast.splat176
  %37 = fmul <2 x double> %strided.vec173, %broadcast.splat176
  %38 = add nsw i64 %32, 3
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv53, i64 %38
  %40 = fmul <2 x double> %strided.vec174, %broadcast.splat176
  %41 = getelementptr double, double* %39, i64 -3
  %42 = bitcast double* %41 to <8 x double>*
  %43 = shufflevector <2 x double> %35, <2 x double> %36, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %44 = shufflevector <2 x double> %37, <2 x double> %40, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec177 = shufflevector <4 x double> %43, <4 x double> %44, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec177, <8 x double>* %42, align 8
  %index.next162 = add i64 %index161, 2
  %45 = icmp eq i64 %index.next162, %n.vec158
  br i1 %45, label %middle.block153, label %vector.body152, !llvm.loop !3

middle.block153:                                  ; preds = %vector.body152
  %cmp.n165 = icmp eq i64 %n.mod.vf157, 0
  br i1 %cmp.n165, label %..preheader23_crit_edge.us, label %.preheader24.us.new.preheader179

._crit_edge29.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us.loopexit, %..preheader23_crit_edge.us
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %._crit_edge31.loopexit, label %.preheader24.us

.preheader24.us.new:                              ; preds = %.preheader24.us.new.preheader179, %.preheader24.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader24.us.new ], [ %indvars.iv.ph, %.preheader24.us.new.preheader179 ]
  %46 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %4
  store double %48, double* %46, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv.next
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %4
  store double %51, double* %49, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv.next.1
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %4
  store double %54, double* %52, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv.next.2
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %4
  store double %57, double* %55, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %..preheader23_crit_edge.us.loopexit, label %.preheader24.us.new, !llvm.loop !6

..preheader23_crit_edge.us.loopexit:              ; preds = %.preheader24.us.new
  br label %..preheader23_crit_edge.us

..preheader23_crit_edge.us:                       ; preds = %..preheader23_crit_edge.us.loopexit, %middle.block153, %.prol.loopexit
  br i1 %brmerge.demorgan, label %.preheader.us.us.preheader, label %._crit_edge29.us

.preheader.us.us.preheader:                       ; preds = %..preheader23_crit_edge.us
  %58 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv53, i64 0
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %scevgep119 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv50, i64 2
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv53, i64 %indvars.iv50
  br i1 %lcmp.mod48, label %.prol.loopexit46, label %.prol.preheader45

.prol.preheader45:                                ; preds = %.preheader.us.us
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %3
  %62 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv50, i64 0
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = load double, double* %58, align 8
  %66 = fadd double %65, %64
  store double %66, double* %58, align 8
  br label %.prol.loopexit46

.prol.loopexit46:                                 ; preds = %.prol.preheader45, %.preheader.us.us
  %indvars.iv42.unr.ph = phi i64 [ 1, %.prol.preheader45 ], [ 0, %.preheader.us.us ]
  br i1 %17, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit46
  %67 = sub nsw i64 %18, %indvars.iv42.unr.ph
  %68 = lshr i64 %67, 1
  %69 = add nuw i64 %68, 1
  %min.iters.check104 = icmp ult i64 %69, 2
  br i1 %min.iters.check104, label %.preheader.us.us.new.preheader178, label %min.iters.checked105

.preheader.us.us.new.preheader178:                ; preds = %middle.block102, %vector.memcheck132, %min.iters.checked105, %.preheader.us.us.new.preheader
  %indvars.iv42.ph = phi i64 [ %indvars.iv42.unr.ph, %vector.memcheck132 ], [ %indvars.iv42.unr.ph, %min.iters.checked105 ], [ %indvars.iv42.unr.ph, %.preheader.us.us.new.preheader ], [ %ind.end137, %middle.block102 ]
  br label %.preheader.us.us.new

min.iters.checked105:                             ; preds = %.preheader.us.us.new.preheader
  %n.mod.vf106 = and i64 %69, 1
  %n.vec107 = sub i64 %69, %n.mod.vf106
  %cmp.zero108 = icmp eq i64 %n.vec107, 0
  br i1 %cmp.zero108, label %.preheader.us.us.new.preheader178, label %vector.memcheck132

vector.memcheck132:                               ; preds = %min.iters.checked105
  %scevgep111 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv42.unr.ph
  %70 = sub nsw i64 %19, %indvars.iv42.unr.ph
  %71 = and i64 %70, -2
  %72 = or i64 %indvars.iv42.unr.ph, %71
  %scevgep114 = getelementptr double, double* %scevgep113, i64 %72
  %scevgep117 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv50, i64 %indvars.iv42.unr.ph
  %scevgep120 = getelementptr double, double* %scevgep119, i64 %72
  %bound0124 = icmp ult double* %scevgep111, %59
  %bound1125 = icmp ult double* %59, %scevgep114
  %found.conflict126 = and i1 %bound0124, %bound1125
  %bound0127 = icmp ult double* %scevgep111, %scevgep120
  %bound1128 = icmp ult double* %scevgep117, %scevgep114
  %found.conflict129 = and i1 %bound0127, %bound1128
  %conflict.rdx130 = or i1 %found.conflict126, %found.conflict129
  %73 = or i64 %indvars.iv42.unr.ph, 2
  %74 = shl nuw i64 %68, 1
  %75 = add i64 %73, %74
  %76 = shl nuw nsw i64 %n.mod.vf106, 1
  %ind.end137 = sub i64 %75, %76
  br i1 %conflict.rdx130, label %.preheader.us.us.new.preheader178, label %vector.ph133

vector.ph133:                                     ; preds = %vector.memcheck132
  br label %vector.body101

vector.body101:                                   ; preds = %vector.body101, %vector.ph133
  %index134 = phi i64 [ 0, %vector.ph133 ], [ %index.next135, %vector.body101 ]
  %77 = shl i64 %index134, 1
  %offset.idx139 = or i64 %indvars.iv42.unr.ph, %77
  %78 = load double, double* %59, align 8, !alias.scope !8
  %79 = insertelement <2 x double> undef, double %78, i32 0
  %80 = fmul <2 x double> %79, %broadcast.splatinsert143
  %81 = shufflevector <2 x double> %80, <2 x double> undef, <2 x i32> zeroinitializer
  %82 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv50, i64 %offset.idx139
  %83 = bitcast double* %82 to <4 x double>*
  %wide.vec145 = load <4 x double>, <4 x double>* %83, align 8, !alias.scope !11
  %strided.vec146 = shufflevector <4 x double> %wide.vec145, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec147 = shufflevector <4 x double> %wide.vec145, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %84 = fmul <2 x double> %81, %strided.vec146
  %85 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv53, i64 %offset.idx139
  %86 = bitcast double* %85 to <4 x double>*
  %wide.vec148 = load <4 x double>, <4 x double>* %86, align 8, !alias.scope !13, !noalias !15
  %strided.vec149 = shufflevector <4 x double> %wide.vec148, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec150 = shufflevector <4 x double> %wide.vec148, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %87 = fadd <2 x double> %strided.vec149, %84
  %88 = add nuw nsw i64 %offset.idx139, 1
  %89 = load double, double* %59, align 8, !alias.scope !8
  %90 = insertelement <2 x double> undef, double %89, i32 0
  %91 = fmul <2 x double> %90, %broadcast.splatinsert143
  %92 = shufflevector <2 x double> %91, <2 x double> undef, <2 x i32> zeroinitializer
  %93 = fmul <2 x double> %92, %strided.vec147
  %94 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv53, i64 %88
  %95 = fadd <2 x double> %strided.vec150, %93
  %96 = getelementptr double, double* %94, i64 -1
  %97 = bitcast double* %96 to <4 x double>*
  %interleaved.vec151 = shufflevector <2 x double> %87, <2 x double> %95, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec151, <4 x double>* %97, align 8, !alias.scope !13, !noalias !15
  %index.next135 = add i64 %index134, 2
  %98 = icmp eq i64 %index.next135, %n.vec107
  br i1 %98, label %middle.block102, label %vector.body101, !llvm.loop !16

middle.block102:                                  ; preds = %vector.body101
  %cmp.n138 = icmp eq i64 %n.mod.vf106, 0
  br i1 %cmp.n138, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader178

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %middle.block102, %.prol.loopexit46
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond, label %._crit_edge29.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader178, %.preheader.us.us.new
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.1, %.preheader.us.us.new ], [ %indvars.iv42.ph, %.preheader.us.us.new.preheader178 ]
  %99 = load double, double* %59, align 8
  %100 = fmul double %99, %3
  %101 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv50, i64 %indvars.iv42
  %102 = load double, double* %101, align 8
  %103 = fmul double %100, %102
  %104 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv42
  %105 = load double, double* %104, align 8
  %106 = fadd double %105, %103
  store double %106, double* %104, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %107 = load double, double* %59, align 8
  %108 = fmul double %107, %3
  %109 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv50, i64 %indvars.iv.next43
  %110 = load double, double* %109, align 8
  %111 = fmul double %108, %110
  %112 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv.next43
  %113 = load double, double* %112, align 8
  %114 = fadd double %113, %111
  store double %114, double* %112, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next43.1, %wide.trip.count44.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new, !llvm.loop !17

.preheader24:                                     ; preds = %.preheader24.preheader, %._crit_edge29
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge29 ], [ 0, %.preheader24.preheader ]
  %scevgep82 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv70, i64 2
  br i1 %brmerge78.demorgan, label %.preheader.us.preheader, label %._crit_edge29

.preheader.us.preheader:                          ; preds = %.preheader24
  %115 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv70, i64 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep88 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv66, i64 2
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv70, i64 %indvars.iv66
  br i1 %lcmp.mod65, label %.preheader.us.new.preheader, label %.prol.preheader62

.prol.preheader62:                                ; preds = %.preheader.us
  %117 = load double, double* %116, align 8
  %118 = fmul double %117, %3
  %119 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv66, i64 0
  %120 = load double, double* %119, align 8
  %121 = fmul double %118, %120
  %122 = load double, double* %115, align 8
  %123 = fadd double %122, %121
  store double %123, double* %115, align 8
  br label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.preheader.us, %.prol.preheader62
  %indvars.iv58.unr.ph = phi i64 [ 1, %.prol.preheader62 ], [ 0, %.preheader.us ]
  %124 = sub nsw i64 %13, %indvars.iv58.unr.ph
  %125 = lshr i64 %124, 1
  %126 = add nuw i64 %125, 1
  %min.iters.check = icmp ult i64 %126, 2
  br i1 %min.iters.check, label %.preheader.us.new.preheader180, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us.new.preheader
  %n.mod.vf = and i64 %126, 1
  %n.vec = sub i64 %126, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader.us.new.preheader180, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep80 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv58.unr.ph
  %127 = sub nsw i64 %14, %indvars.iv58.unr.ph
  %128 = and i64 %127, -2
  %129 = or i64 %indvars.iv58.unr.ph, %128
  %scevgep83 = getelementptr double, double* %scevgep82, i64 %129
  %scevgep86 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv66, i64 %indvars.iv58.unr.ph
  %scevgep89 = getelementptr double, double* %scevgep88, i64 %129
  %bound0 = icmp ult double* %scevgep80, %116
  %bound1 = icmp ult double* %116, %scevgep83
  %found.conflict = and i1 %bound0, %bound1
  %bound092 = icmp ult double* %scevgep80, %scevgep89
  %bound193 = icmp ult double* %scevgep86, %scevgep83
  %found.conflict94 = and i1 %bound092, %bound193
  %conflict.rdx = or i1 %found.conflict, %found.conflict94
  %130 = or i64 %indvars.iv58.unr.ph, 2
  %131 = shl nuw i64 %125, 1
  %132 = add i64 %130, %131
  %133 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %132, %133
  br i1 %conflict.rdx, label %.preheader.us.new.preheader180, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %134 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv58.unr.ph, %134
  %135 = load double, double* %116, align 8, !alias.scope !18
  %136 = insertelement <2 x double> undef, double %135, i32 0
  %137 = fmul <2 x double> %136, %broadcast.splatinsert95
  %138 = shufflevector <2 x double> %137, <2 x double> undef, <2 x i32> zeroinitializer
  %139 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv66, i64 %offset.idx
  %140 = bitcast double* %139 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %140, align 8, !alias.scope !21
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec97 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %141 = fmul <2 x double> %138, %strided.vec
  %142 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv70, i64 %offset.idx
  %143 = bitcast double* %142 to <4 x double>*
  %wide.vec98 = load <4 x double>, <4 x double>* %143, align 8, !alias.scope !23, !noalias !25
  %strided.vec99 = shufflevector <4 x double> %wide.vec98, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec100 = shufflevector <4 x double> %wide.vec98, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %144 = fadd <2 x double> %strided.vec99, %141
  %145 = add nuw nsw i64 %offset.idx, 1
  %146 = load double, double* %116, align 8, !alias.scope !18
  %147 = insertelement <2 x double> undef, double %146, i32 0
  %148 = fmul <2 x double> %147, %broadcast.splatinsert95
  %149 = shufflevector <2 x double> %148, <2 x double> undef, <2 x i32> zeroinitializer
  %150 = fmul <2 x double> %149, %strided.vec97
  %151 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv70, i64 %145
  %152 = fadd <2 x double> %strided.vec100, %150
  %153 = getelementptr double, double* %151, i64 -1
  %154 = bitcast double* %153 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %144, <2 x double> %152, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %154, align 8, !alias.scope !23, !noalias !25
  %index.next = add i64 %index, 2
  %155 = icmp eq i64 %index.next, %n.vec
  br i1 %155, label %middle.block, label %vector.body, !llvm.loop !26

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge.us, label %.preheader.us.new.preheader180

.preheader.us.new.preheader180:                   ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us.new.preheader
  %indvars.iv58.ph = phi i64 [ %indvars.iv58.unr.ph, %vector.memcheck ], [ %indvars.iv58.unr.ph, %min.iters.checked ], [ %indvars.iv58.unr.ph, %.preheader.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader180, %.preheader.us.new
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.1, %.preheader.us.new ], [ %indvars.iv58.ph, %.preheader.us.new.preheader180 ]
  %156 = load double, double* %116, align 8
  %157 = fmul double %156, %3
  %158 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv66, i64 %indvars.iv58
  %159 = load double, double* %158, align 8
  %160 = fmul double %157, %159
  %161 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv58
  %162 = load double, double* %161, align 8
  %163 = fadd double %162, %160
  store double %163, double* %161, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %164 = load double, double* %116, align 8
  %165 = fmul double %164, %3
  %166 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv66, i64 %indvars.iv.next59
  %167 = load double, double* %166, align 8
  %168 = fmul double %165, %167
  %169 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv.next59
  %170 = load double, double* %169, align 8
  %171 = fadd double %170, %168
  store double %171, double* %169, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %exitcond61.1 = icmp eq i64 %indvars.iv.next59.1, %wide.trip.count60.1
  br i1 %exitcond61.1, label %._crit_edge.us.loopexit, label %.preheader.us.new, !llvm.loop !27

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  br i1 %exitcond69, label %._crit_edge29.loopexit, label %.preheader.us

._crit_edge29.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %.preheader24
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond73, label %._crit_edge31.loopexit181, label %.preheader24

._crit_edge31.loopexit:                           ; preds = %._crit_edge29.us
  br label %._crit_edge31

._crit_edge31.loopexit181:                        ; preds = %._crit_edge29
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit181, %._crit_edge31.loopexit, %8
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1100 x double]*) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count15 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv13, %10
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %19 ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  br i1 %exitcond16, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!9, !12}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = !{!24}
!24 = distinct !{!24, !20}
!25 = !{!19, !22}
!26 = distinct !{!26, !4, !5}
!27 = distinct !{!27, !4, !5}
