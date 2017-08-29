; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
.preheader10.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %.preheader10.lr.ph, %.loopexit22.us
  %indvars.iv719.us = phi i64 [ %indvars.iv.next8.us, %.loopexit22.us ], [ 0, %.preheader10.lr.ph ]
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader10.us
  %indvars.iv516.us = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next6.us, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv516.us, %indvars.iv719.us
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 1200
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv719.us, i64 %indvars.iv516.us
  %14 = add nuw nsw i64 %8, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = insertelement <2 x double> undef, double %12, i32 0
  %19 = insertelement <2 x double> %18, double %17, i32 1
  %20 = fdiv <2 x double> %19, <double 1.200000e+03, double 1.000000e+03>
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %13, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv719.us, i64 %indvars.iv516.us
  store double %22, double* %23, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv516.us, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next6.us, 1000
  br i1 %exitcond26, label %.loopexit22.us, label %7

.loopexit22.us:                                   ; preds = %7
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv719.us, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next8.us, 1200
  br i1 %exitcond27, label %.preheader.preheader, label %.preheader10.us

.preheader.preheader:                             ; preds = %.loopexit22.us
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.loopexit
  %indvars.iv313 = phi i64 [ %indvars.iv.next4, %.loopexit ], [ 0, %.preheader.preheader ]
  br label %24

; <label>:24:                                     ; preds = %.preheader, %24
  %indvars.iv12 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %24 ]
  %25 = mul nuw nsw i64 %indvars.iv12, %indvars.iv313
  %26 = add nuw nsw i64 %25, 3
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1200
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.000000e+03
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv313, i64 %indvars.iv12
  store double %30, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.loopexit, label %24

.loopexit:                                        ; preds = %24
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv313, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond25, label %.loopexit21, label %.preheader

.loopexit21:                                      ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
.preheader18.lr.ph:
  %broadcast.splatinsert63 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat64 = shufflevector <2 x double> %broadcast.splatinsert63, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert84 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat85 = shufflevector <2 x double> %broadcast.splatinsert84, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader18.us

.preheader18.us:                                  ; preds = %.preheader18.lr.ph, %.loopexit.us
  %indvars.iv = phi i2 [ 1, %.preheader18.lr.ph ], [ %indvars.iv.next, %.loopexit.us ]
  %indvars.iv1324.us = phi i64 [ 1, %.preheader18.lr.ph ], [ %indvars.iv.next14.us, %.loopexit.us ]
  %indvars.iv1522.us = phi i64 [ 0, %.preheader18.lr.ph ], [ %12, %.loopexit.us ]
  %7 = zext i2 %indvars.iv to i64
  %8 = add nsw i64 %indvars.iv1522.us, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 0
  %9 = mul nuw nsw i64 %indvars.iv1522.us, 1201
  %10 = add nuw nsw i64 %9, 1
  %scevgep39 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %10
  %11 = add nuw nsw i64 %indvars.iv1522.us, 1
  %12 = add nuw nsw i64 %indvars.iv1522.us, 1
  %xtraiter = and i64 %12, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader18.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv19.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv19.us.prol
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv19.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader18.us
  %indvars.iv19.us.unr = phi i64 [ 0, %.preheader18.us ], [ %7, %.prol.loopexit.loopexit ]
  %16 = icmp ult i64 %indvars.iv1522.us, 3
  br i1 %16, label %.preheader.us.preheader, label %.preheader18.us.new.preheader

.preheader18.us.new.preheader:                    ; preds = %.prol.loopexit
  %17 = sub i64 %8, %indvars.iv19.us.unr
  %18 = lshr i64 %17, 2
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check68 = icmp ult i64 %19, 2
  br i1 %min.iters.check68, label %.preheader18.us.new.preheader86, label %min.iters.checked69

min.iters.checked69:                              ; preds = %.preheader18.us.new.preheader
  %n.mod.vf70 = and i64 %19, 1
  %n.vec71 = sub nsw i64 %19, %n.mod.vf70
  %cmp.zero72 = icmp eq i64 %n.vec71, 0
  %20 = or i64 %indvars.iv19.us.unr, 4
  %21 = shl nuw i64 %18, 2
  %22 = add i64 %20, %21
  %23 = shl nuw nsw i64 %n.mod.vf70, 2
  %ind.end = sub i64 %22, %23
  br i1 %cmp.zero72, label %.preheader18.us.new.preheader86, label %vector.ph73

vector.ph73:                                      ; preds = %min.iters.checked69
  br label %vector.body65

vector.body65:                                    ; preds = %vector.body65, %vector.ph73
  %index74 = phi i64 [ 0, %vector.ph73 ], [ %index.next75, %vector.body65 ]
  %24 = shl i64 %index74, 2
  %offset.idx = or i64 %indvars.iv19.us.unr, %24
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %offset.idx
  %26 = bitcast double* %25 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %26, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec81 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec82 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec83 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %27 = fmul <2 x double> %strided.vec, %broadcast.splat85
  %28 = fmul <2 x double> %strided.vec81, %broadcast.splat85
  %29 = fmul <2 x double> %strided.vec82, %broadcast.splat85
  %30 = add nsw i64 %offset.idx, 3
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %30
  %32 = fmul <2 x double> %strided.vec83, %broadcast.splat85
  %33 = getelementptr double, double* %31, i64 -3
  %34 = bitcast double* %33 to <8 x double>*
  %35 = shufflevector <2 x double> %27, <2 x double> %28, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %36 = shufflevector <2 x double> %29, <2 x double> %32, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %35, <4 x double> %36, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %34, align 8
  %index.next75 = add i64 %index74, 2
  %37 = icmp eq i64 %index.next75, %n.vec71
  br i1 %37, label %middle.block66, label %vector.body65, !llvm.loop !3

middle.block66:                                   ; preds = %vector.body65
  %cmp.n77 = icmp eq i64 %n.mod.vf70, 0
  br i1 %cmp.n77, label %.preheader.us.preheader, label %.preheader18.us.new.preheader86

.preheader18.us.new.preheader86:                  ; preds = %middle.block66, %min.iters.checked69, %.preheader18.us.new.preheader
  %indvars.iv19.us.ph = phi i64 [ %indvars.iv19.us.unr, %min.iters.checked69 ], [ %indvars.iv19.us.unr, %.preheader18.us.new.preheader ], [ %ind.end, %middle.block66 ]
  br label %.preheader18.us.new

.preheader18.us.new:                              ; preds = %.preheader18.us.new.preheader86, %.preheader18.us.new
  %indvars.iv19.us = phi i64 [ %indvars.iv.next.us.3, %.preheader18.us.new ], [ %indvars.iv19.us.ph, %.preheader18.us.new.preheader86 ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv19.us
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %3
  store double %40, double* %38, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv19.us, 1
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us
  %42 = load double, double* %41, align 8
  %43 = fmul double %42, %3
  store double %43, double* %41, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv19.us, 2
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us.1
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %3
  store double %46, double* %44, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv19.us, 3
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us.2
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %3
  store double %49, double* %47, align 8
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv19.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv1324.us
  br i1 %exitcond.us.3, label %.preheader.us.preheader.loopexit, label %.preheader18.us.new, !llvm.loop !6

.preheader.us.preheader.loopexit:                 ; preds = %.preheader18.us.new
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %middle.block66, %.prol.loopexit
  %min.iters.check = icmp ult i64 %11, 2
  %n.vec = and i64 %11, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %11, %n.vec
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.loopexit
  %indvars.iv1121.us = phi i64 [ %indvars.iv.next12.us, %.loopexit ], [ 0, %.preheader.us.preheader ]
  %scevgep41 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv1121.us
  %50 = add nuw nsw i64 %indvars.iv1121.us, 1
  %scevgep43 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522.us, i64 %50
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv1121.us
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv1522.us, i64 %50
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv1522.us, i64 %indvars.iv1121.us
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522.us, i64 %indvars.iv1121.us
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %52
  %bound1 = icmp ult double* %52, %scevgep39
  %found.conflict = and i1 %bound0, %bound1
  %bound050 = icmp ult double* %scevgep, %scevgep43
  %bound151 = icmp ult double* %scevgep41, %scevgep39
  %found.conflict52 = and i1 %bound050, %bound151
  %conflict.rdx = or i1 %found.conflict, %found.conflict52
  %bound053 = icmp ult double* %scevgep, %scevgep47
  %bound154 = icmp ult double* %scevgep45, %scevgep39
  %found.conflict55 = and i1 %bound053, %bound154
  %conflict.rdx56 = or i1 %conflict.rdx, %found.conflict55
  %bound059 = icmp ult double* %scevgep, %51
  %bound160 = icmp ult double* %51, %scevgep39
  %found.conflict61 = and i1 %bound059, %bound160
  %conflict.rdx62 = or i1 %conflict.rdx56, %found.conflict61
  br i1 %conflict.rdx62, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %53 = load double, double* %51, align 8, !alias.scope !8
  %54 = insertelement <2 x double> undef, double %53, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  %56 = load double, double* %52, align 8, !alias.scope !11
  %57 = insertelement <2 x double> undef, double %56, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %59 = or i64 %index, 1
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv1121.us
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %59, i64 %indvars.iv1121.us
  %62 = load double, double* %60, align 8, !alias.scope !13
  %63 = load double, double* %61, align 8, !alias.scope !13
  %64 = insertelement <2 x double> undef, double %62, i32 0
  %65 = insertelement <2 x double> %64, double %63, i32 1
  %66 = fmul <2 x double> %65, %broadcast.splat64
  %67 = fmul <2 x double> %66, %55
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv1121.us
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %59, i64 %indvars.iv1121.us
  %70 = load double, double* %68, align 8, !alias.scope !15
  %71 = load double, double* %69, align 8, !alias.scope !15
  %72 = insertelement <2 x double> undef, double %70, i32 0
  %73 = insertelement <2 x double> %72, double %71, i32 1
  %74 = fmul <2 x double> %73, %broadcast.splat64
  %75 = fmul <2 x double> %74, %58
  %76 = fadd <2 x double> %67, %75
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %index
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !17, !noalias !19
  %79 = fadd <2 x double> %wide.load, %76
  %80 = bitcast double* %77 to <2 x double>*
  store <2 x double> %79, <2 x double>* %80, align 8, !alias.scope !17, !noalias !19
  %index.next = add i64 %index, 2
  %81 = icmp eq i64 %index.next, %n.vec
  br i1 %81, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %.loopexit, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv520.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv520.us = phi i64 [ %indvars.iv.next6.us, %scalar.ph ], [ %indvars.iv520.us.ph, %scalar.ph.preheader ]
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv520.us, i64 %indvars.iv1121.us
  %83 = load double, double* %82, align 8
  %84 = fmul double %83, %2
  %85 = load double, double* %51, align 8
  %86 = fmul double %84, %85
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv520.us, i64 %indvars.iv1121.us
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, %2
  %90 = load double, double* %52, align 8
  %91 = fmul double %89, %90
  %92 = fadd double %86, %91
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv520.us
  %94 = load double, double* %93, align 8
  %95 = fadd double %94, %92
  store double %95, double* %93, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv520.us, 1
  %exitcond10.us = icmp eq i64 %indvars.iv.next6.us, %indvars.iv1324.us
  br i1 %exitcond10.us, label %.loopexit.loopexit, label %scalar.ph, !llvm.loop !21

.loopexit.loopexit:                               ; preds = %scalar.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1121.us, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next12.us, 1000
  br i1 %exitcond29, label %.loopexit.us, label %.preheader.us

.loopexit.us:                                     ; preds = %.loopexit
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1324.us, 1
  %exitcond30 = icmp eq i64 %12, 1200
  %indvars.iv.next = add i2 %indvars.iv, 1
  br i1 %exitcond30, label %.loopexit27, label %.preheader18.us

.loopexit27:                                      ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]* nocapture readonly) #0 {
.preheader.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %.loopexit, %.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %.loopexit ], [ 0, %.preheader.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv26, 1200
  br label %7

; <label>:7:                                      ; preds = %.preheader, %14
  %indvars.iv5 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv5, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.loopexit, label %7

.loopexit:                                        ; preds = %14
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond11, label %.loopexit9, label %.preheader

.loopexit9:                                       ; preds = %.loopexit
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
!15 = !{!16}
!16 = distinct !{!16, !10}
!17 = !{!18}
!18 = distinct !{!18, !10}
!19 = !{!12, !14, !16, !9}
!20 = distinct !{!20, !4, !5}
!21 = distinct !{!21, !4, !5}
