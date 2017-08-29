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
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call void @print_array(i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
.preheader4.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.lr.ph, %._crit_edge11.us
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge11.us ], [ 0, %.preheader4.lr.ph ]
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15, %.preheader4.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge15 ], [ 0, %.preheader4.us ]
  %7 = mul nuw nsw i64 %indvars.iv24, %indvars.iv28
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv24
  store double %12, double* %13, align 8
  %14 = add nuw nsw i64 %7, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv28, i64 %indvars.iv24
  store double %18, double* %19, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 1000
  br i1 %exitcond27, label %._crit_edge11.us, label %._crit_edge15

._crit_edge11.us:                                 ; preds = %._crit_edge15
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 1200
  br i1 %exitcond31, label %.preheader.us.preheader, label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge11.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge16 ], [ 0, %.preheader.us ]
  %20 = mul nuw nsw i64 %indvars.iv, %indvars.iv20
  %21 = add nuw nsw i64 %20, 3
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 1200
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv
  store double %25, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge16

._crit_edge.us:                                   ; preds = %._crit_edge16
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 1200
  br i1 %exitcond23, label %.preheader3._crit_edge, label %.preheader.us

.preheader3._crit_edge:                           ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
.preheader4.lr.ph:
  %broadcast.splatinsert111 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat112 = shufflevector <2 x double> %broadcast.splatinsert111, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert136 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat137 = shufflevector <2 x double> %broadcast.splatinsert136, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

._crit_edge22:                                    ; preds = %._crit_edge22.preheader139, %._crit_edge22
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge22 ], [ %indvars.iv.ph, %._crit_edge22.preheader139 ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %3
  store double %9, double* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv.next
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv42
  br i1 %exitcond.3, label %.preheader.us15.preheader.loopexit, label %._crit_edge22, !llvm.loop !1

.preheader.us15.preheader.loopexit:               ; preds = %._crit_edge22
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %.preheader.us15.preheader.loopexit, %middle.block114, %._crit_edge22.prol.loopexit
  %min.iters.check72 = icmp ult i64 %71, 2
  %n.vec75 = and i64 %71, -2
  %cmp.zero76 = icmp eq i64 %n.vec75, 0
  %cmp.n107 = icmp eq i64 %71, %n.vec75
  br label %.preheader.us15

._crit_edge23:                                    ; preds = %._crit_edge23.preheader, %._crit_edge23
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge23 ], [ %indvars.iv32.ph, %._crit_edge23.preheader ]
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv37
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %2
  %22 = load double, double* %34, align 8
  %23 = fmul double %21, %22
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv32, i64 %indvars.iv37
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %2
  %27 = load double, double* %35, align 8
  %28 = fmul double %26, %27
  %29 = fadd double %23, %28
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv32
  %31 = load double, double* %30, align 8
  %32 = fadd double %31, %29
  store double %32, double* %30, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond = icmp eq i64 %indvars.iv.next33, %indvars.iv42
  br i1 %exitcond, label %._crit_edge.us18.loopexit, label %._crit_edge23, !llvm.loop !5

.preheader.us15:                                  ; preds = %.preheader.us15.preheader, %._crit_edge.us18
  %indvars.iv37 = phi i64 [ %33, %._crit_edge.us18 ], [ 0, %.preheader.us15.preheader ]
  %scevgep81 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv37
  %33 = add nuw nsw i64 %indvars.iv37, 1
  %scevgep83 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv44, i64 %33
  %scevgep85 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv37
  %scevgep87 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv44, i64 %33
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv44, i64 %indvars.iv37
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv44, i64 %indvars.iv37
  br i1 %min.iters.check72, label %._crit_edge23.preheader, label %min.iters.checked73

._crit_edge23.preheader:                          ; preds = %middle.block70, %vector.memcheck, %min.iters.checked73, %.preheader.us15
  %indvars.iv32.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked73 ], [ 0, %.preheader.us15 ], [ %n.vec75, %middle.block70 ]
  br label %._crit_edge23

min.iters.checked73:                              ; preds = %.preheader.us15
  br i1 %cmp.zero76, label %._crit_edge23.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked73
  %bound0 = icmp ult double* %scevgep, %35
  %bound1 = icmp ult double* %35, %scevgep79
  %found.conflict = and i1 %bound0, %bound1
  %bound090 = icmp ult double* %scevgep, %scevgep83
  %bound191 = icmp ult double* %scevgep81, %scevgep79
  %found.conflict92 = and i1 %bound090, %bound191
  %conflict.rdx = or i1 %found.conflict, %found.conflict92
  %bound093 = icmp ult double* %scevgep, %scevgep87
  %bound194 = icmp ult double* %scevgep85, %scevgep79
  %found.conflict95 = and i1 %bound093, %bound194
  %conflict.rdx96 = or i1 %conflict.rdx, %found.conflict95
  %bound099 = icmp ult double* %scevgep, %34
  %bound1100 = icmp ult double* %34, %scevgep79
  %found.conflict101 = and i1 %bound099, %bound1100
  %conflict.rdx102 = or i1 %conflict.rdx96, %found.conflict101
  br i1 %conflict.rdx102, label %._crit_edge23.preheader, label %vector.ph103

vector.ph103:                                     ; preds = %vector.memcheck
  br label %vector.body69

vector.body69:                                    ; preds = %vector.body69, %vector.ph103
  %index104 = phi i64 [ 0, %vector.ph103 ], [ %index.next105, %vector.body69 ]
  %36 = or i64 %index104, 1
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index104, i64 %indvars.iv37
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %36, i64 %indvars.iv37
  %39 = load double, double* %37, align 8, !alias.scope !6
  %40 = load double, double* %38, align 8, !alias.scope !6
  %41 = insertelement <2 x double> undef, double %39, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  %43 = fmul <2 x double> %42, %broadcast.splat112
  %44 = load double, double* %34, align 8, !alias.scope !9
  %45 = insertelement <2 x double> undef, double %44, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = fmul <2 x double> %43, %46
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index104, i64 %indvars.iv37
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %36, i64 %indvars.iv37
  %50 = load double, double* %48, align 8, !alias.scope !11
  %51 = load double, double* %49, align 8, !alias.scope !11
  %52 = insertelement <2 x double> undef, double %50, i32 0
  %53 = insertelement <2 x double> %52, double %51, i32 1
  %54 = fmul <2 x double> %53, %broadcast.splat112
  %55 = load double, double* %35, align 8, !alias.scope !13
  %56 = insertelement <2 x double> undef, double %55, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = fmul <2 x double> %54, %57
  %59 = fadd <2 x double> %47, %58
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %index104
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !15, !noalias !17
  %62 = fadd <2 x double> %wide.load, %59
  store <2 x double> %62, <2 x double>* %61, align 8, !alias.scope !15, !noalias !17
  %index.next105 = add i64 %index104, 2
  %63 = icmp eq i64 %index.next105, %n.vec75
  br i1 %63, label %middle.block70, label %vector.body69, !llvm.loop !18

middle.block70:                                   ; preds = %vector.body69
  br i1 %cmp.n107, label %._crit_edge.us18, label %._crit_edge23.preheader

.lr.ph.us:                                        ; preds = %.preheader4.lr.ph, %._crit_edge9.us
  %indvars.iv140 = phi i2 [ 1, %.preheader4.lr.ph ], [ %indvars.iv.next141, %._crit_edge9.us ]
  %indvars.iv44 = phi i64 [ 0, %.preheader4.lr.ph ], [ %71, %._crit_edge9.us ]
  %indvars.iv42 = phi i64 [ 1, %.preheader4.lr.ph ], [ %indvars.iv.next43, %._crit_edge9.us ]
  %64 = zext i2 %indvars.iv140 to i64
  %65 = add nuw nsw i64 %64, 4294967295
  %66 = and i64 %65, 4294967295
  %67 = add nuw nsw i64 %66, 1
  %68 = add nsw i64 %indvars.iv44, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 0
  %69 = mul nuw nsw i64 %indvars.iv44, 1201
  %70 = add nuw nsw i64 %69, 1
  %scevgep79 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %70
  %71 = add nuw nsw i64 %indvars.iv44, 1
  %72 = trunc i64 %71 to i32
  %xtraiter = and i32 %72, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge22.prol.loopexit, label %._crit_edge22.prol.preheader

._crit_edge22.prol.preheader:                     ; preds = %.lr.ph.us
  br label %._crit_edge22.prol

._crit_edge22.prol:                               ; preds = %._crit_edge22.prol.preheader, %._crit_edge22.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge22.prol ], [ 0, %._crit_edge22.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge22.prol ], [ %xtraiter, %._crit_edge22.prol.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv.prol
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %3
  store double %75, double* %73, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge22.prol.loopexit.loopexit, label %._crit_edge22.prol, !llvm.loop !19

._crit_edge22.prol.loopexit.loopexit:             ; preds = %._crit_edge22.prol
  br label %._crit_edge22.prol.loopexit

._crit_edge22.prol.loopexit:                      ; preds = %._crit_edge22.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %67, %._crit_edge22.prol.loopexit.loopexit ]
  %76 = icmp ult i64 %indvars.iv44, 3
  br i1 %76, label %.preheader.us15.preheader, label %._crit_edge22.preheader

._crit_edge22.preheader:                          ; preds = %._crit_edge22.prol.loopexit
  %77 = sub i64 %68, %indvars.iv.unr
  %78 = lshr i64 %77, 2
  %79 = add nuw nsw i64 %78, 1
  %min.iters.check116 = icmp ult i64 %79, 2
  br i1 %min.iters.check116, label %._crit_edge22.preheader139, label %min.iters.checked117

._crit_edge22.preheader139:                       ; preds = %middle.block114, %min.iters.checked117, %._crit_edge22.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked117 ], [ %indvars.iv.unr, %._crit_edge22.preheader ], [ %ind.end125, %middle.block114 ]
  br label %._crit_edge22

min.iters.checked117:                             ; preds = %._crit_edge22.preheader
  %n.mod.vf118 = and i64 %79, 1
  %n.vec119 = sub nsw i64 %79, %n.mod.vf118
  %cmp.zero120 = icmp eq i64 %n.vec119, 0
  %80 = add nsw i64 %indvars.iv.unr, 4
  %81 = shl nuw i64 %78, 2
  %82 = add i64 %80, %81
  %83 = shl nuw nsw i64 %n.mod.vf118, 2
  %ind.end125 = sub i64 %82, %83
  br i1 %cmp.zero120, label %._crit_edge22.preheader139, label %vector.ph121

vector.ph121:                                     ; preds = %min.iters.checked117
  br label %vector.body113

vector.body113:                                   ; preds = %vector.body113, %vector.ph121
  %index122 = phi i64 [ 0, %vector.ph121 ], [ %index.next123, %vector.body113 ]
  %84 = shl i64 %index122, 2
  %offset.idx127 = add i64 %indvars.iv.unr, %84
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %offset.idx127
  %86 = bitcast double* %85 to <8 x double>*
  %wide.vec131 = load <8 x double>, <8 x double>* %86, align 8
  %strided.vec132 = shufflevector <8 x double> %wide.vec131, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec133 = shufflevector <8 x double> %wide.vec131, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec134 = shufflevector <8 x double> %wide.vec131, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec135 = shufflevector <8 x double> %wide.vec131, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %87 = fmul <2 x double> %strided.vec132, %broadcast.splat137
  %88 = fmul <2 x double> %strided.vec133, %broadcast.splat137
  %89 = fmul <2 x double> %strided.vec134, %broadcast.splat137
  %90 = add nsw i64 %offset.idx127, 3
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %90
  %92 = fmul <2 x double> %strided.vec135, %broadcast.splat137
  %93 = getelementptr double, double* %91, i64 -3
  %94 = bitcast double* %93 to <8 x double>*
  %95 = shufflevector <2 x double> %87, <2 x double> %88, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %96 = shufflevector <2 x double> %89, <2 x double> %92, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec138 = shufflevector <4 x double> %95, <4 x double> %96, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec138, <8 x double>* %94, align 8
  %index.next123 = add i64 %index122, 2
  %97 = icmp eq i64 %index.next123, %n.vec119
  br i1 %97, label %middle.block114, label %vector.body113, !llvm.loop !21

middle.block114:                                  ; preds = %vector.body113
  %cmp.n126 = icmp eq i64 %n.mod.vf118, 0
  br i1 %cmp.n126, label %.preheader.us15.preheader, label %._crit_edge22.preheader139

._crit_edge.us18.loopexit:                        ; preds = %._crit_edge23
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %middle.block70
  %exitcond40 = icmp eq i64 %33, 1000
  br i1 %exitcond40, label %._crit_edge9.us, label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond47 = icmp eq i64 %71, 1200
  %indvars.iv.next141 = add i2 %indvars.iv140, 1
  br i1 %exitcond47, label %._crit_edge21, label %.lr.ph.us

._crit_edge21:                                    ; preds = %._crit_edge9.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]* nocapture readonly) #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv10, 1200
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge6, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge6 ], [ 0, %.preheader.us ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge6

; <label>:11:                                     ; preds = %._crit_edge7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge7, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge7

._crit_edge.us:                                   ; preds = %._crit_edge6
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1200
  br i1 %exitcond13, label %._crit_edge5, label %.preheader.us

._crit_edge5:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !3, !4}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!14}
!14 = distinct !{!14, !8}
!15 = !{!16}
!16 = distinct !{!16, !8}
!17 = !{!14, !7, !12, !10}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
