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
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader4.lr.ph, label %._crit_edge8

.preheader4.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  %11 = sitofp i32 %1 to double
  br i1 %9, label %.preheader4.lr.ph..preheader4.us_crit_edge, label %.preheader4.lr.ph..preheader.lr.ph_crit_edge

.preheader4.lr.ph..preheader.lr.ph_crit_edge:     ; preds = %.preheader4.lr.ph
  %.pre = sext i32 %0 to i64
  br label %.preheader.lr.ph

.preheader4.lr.ph..preheader4.us_crit_edge:       ; preds = %.preheader4.lr.ph
  %12 = add i32 %1, -1
  %13 = sext i32 %0 to i64
  %wide.trip.count19 = zext i32 %12 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.lr.ph..preheader4.us_crit_edge
  %indvars.iv21 = phi i64 [ 0, %.preheader4.lr.ph..preheader4.us_crit_edge ], [ %indvars.iv.next22, %._crit_edge11.us ]
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader4.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %14 ], [ 0, %.preheader4.us ]
  %15 = mul nuw nsw i64 %indvars.iv17, %indvars.iv21
  %16 = add nuw nsw i64 %15, 1
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %10
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv21, i64 %indvars.iv17
  store double %20, double* %21, align 8
  %22 = add nuw nsw i64 %15, 2
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, %1
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %11
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv21, i64 %indvars.iv17
  store double %26, double* %27, align 8
  %exitcond20 = icmp eq i64 %indvars.iv17, %wide.trip.count19
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  br i1 %exitcond20, label %._crit_edge11.us, label %14

._crit_edge11.us:                                 ; preds = %14
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next22, %13
  br i1 %exitcond25, label %.preheader.lr.ph.loopexit, label %.preheader4.us

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge11.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader4.lr.ph..preheader.lr.ph_crit_edge
  %.pre-phi = phi i64 [ %.pre, %.preheader4.lr.ph..preheader.lr.ph_crit_edge ], [ %13, %.preheader.lr.ph.loopexit ]
  %28 = add i32 %0, -1
  %wide.trip.count = zext i32 %28 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next16, %._crit_edge.us ]
  br label %29

; <label>:29:                                     ; preds = %29, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %29 ], [ 0, %.preheader.us ]
  %30 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %31 = add nuw nsw i64 %30, 3
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, %0
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %11
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %35, double* %36, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %._crit_edge.us, label %29

._crit_edge.us:                                   ; preds = %29
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %37 = icmp slt i64 %indvars.iv.next16, %.pre-phi
  br i1 %37, label %.preheader.us, label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader4.lr.ph, label %._crit_edge13

.preheader4.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader4.lr.ph..preheader4.us_crit_edge, label %.preheader4.lr.ph..preheader4_crit_edge

.preheader4.lr.ph..preheader4_crit_edge:          ; preds = %.preheader4.lr.ph
  %10 = sext i32 %0 to i64
  %broadcast.splatinsert47 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat48 = shufflevector <2 x double> %broadcast.splatinsert47, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.preheader4.lr.ph..preheader4.us_crit_edge:       ; preds = %.preheader4.lr.ph
  %11 = sext i32 %1 to i64
  %12 = sext i32 %0 to i64
  %broadcast.splatinsert91 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat92 = shufflevector <2 x double> %broadcast.splatinsert91, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert113 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat114 = shufflevector <2 x double> %broadcast.splatinsert113, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

scalar.ph96:                                      ; preds = %scalar.ph96.preheader, %scalar.ph96
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph96 ], [ %indvars.iv.ph, %scalar.ph96.preheader ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %exitcond = icmp eq i64 %indvars.iv, %indvars.iv34
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.preheader.us15.preheader.loopexit, label %scalar.ph96, !llvm.loop !1

scalar.ph51:                                      ; preds = %scalar.ph51.preheader, %scalar.ph51
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %scalar.ph51 ], [ %indvars.iv25.ph, %scalar.ph51.preheader ]
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv31
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %2
  %19 = load double, double* %31, align 8
  %20 = fmul double %18, %19
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv31
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %2
  %24 = load double, double* %32, align 8
  %25 = fmul double %23, %24
  %26 = fadd double %20, %25
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv25
  %28 = load double, double* %27, align 8
  %29 = fadd double %28, %26
  store double %29, double* %27, align 8
  %exitcond30 = icmp eq i64 %indvars.iv25, %indvars.iv34
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  br i1 %exitcond30, label %._crit_edge.us18.loopexit, label %scalar.ph51, !llvm.loop !5

.preheader.us15:                                  ; preds = %._crit_edge.us18, %.preheader.us15.preheader
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us18 ], [ 0, %.preheader.us15.preheader ]
  %scevgep61 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv31
  %30 = add nuw nsw i64 %indvars.iv31, 1
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv34, i64 %30
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv31
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv34, i64 %30
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv31
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv34, i64 %indvars.iv31
  br i1 %min.iters.check52, label %scalar.ph51.preheader, label %min.iters.checked53

scalar.ph51.preheader:                            ; preds = %middle.block50, %vector.memcheck, %min.iters.checked53, %.preheader.us15
  %indvars.iv25.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked53 ], [ 0, %.preheader.us15 ], [ %n.vec55, %middle.block50 ]
  br label %scalar.ph51

min.iters.checked53:                              ; preds = %.preheader.us15
  br i1 %cmp.zero56, label %scalar.ph51.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked53
  %bound0 = icmp ult double* %scevgep, %32
  %bound1 = icmp ult double* %32, %scevgep59
  %found.conflict = and i1 %bound0, %bound1
  %bound070 = icmp ult double* %scevgep, %scevgep63
  %bound171 = icmp ult double* %scevgep61, %scevgep59
  %found.conflict72 = and i1 %bound070, %bound171
  %conflict.rdx = or i1 %found.conflict, %found.conflict72
  %bound073 = icmp ult double* %scevgep, %scevgep67
  %bound174 = icmp ult double* %scevgep65, %scevgep59
  %found.conflict75 = and i1 %bound073, %bound174
  %conflict.rdx76 = or i1 %conflict.rdx, %found.conflict75
  %bound079 = icmp ult double* %scevgep, %31
  %bound180 = icmp ult double* %31, %scevgep59
  %found.conflict81 = and i1 %bound079, %bound180
  %conflict.rdx82 = or i1 %conflict.rdx76, %found.conflict81
  br i1 %conflict.rdx82, label %scalar.ph51.preheader, label %vector.ph83

vector.ph83:                                      ; preds = %vector.memcheck
  br label %vector.body49

vector.body49:                                    ; preds = %vector.body49, %vector.ph83
  %index84 = phi i64 [ 0, %vector.ph83 ], [ %index.next85, %vector.body49 ]
  %33 = or i64 %index84, 1
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index84, i64 %indvars.iv31
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %33, i64 %indvars.iv31
  %36 = load double, double* %34, align 8, !alias.scope !6
  %37 = load double, double* %35, align 8, !alias.scope !6
  %38 = insertelement <2 x double> undef, double %36, i32 0
  %39 = insertelement <2 x double> %38, double %37, i32 1
  %40 = fmul <2 x double> %39, %broadcast.splat92
  %41 = load double, double* %31, align 8, !alias.scope !9
  %42 = insertelement <2 x double> undef, double %41, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = fmul <2 x double> %40, %43
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index84, i64 %indvars.iv31
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %33, i64 %indvars.iv31
  %47 = load double, double* %45, align 8, !alias.scope !11
  %48 = load double, double* %46, align 8, !alias.scope !11
  %49 = insertelement <2 x double> undef, double %47, i32 0
  %50 = insertelement <2 x double> %49, double %48, i32 1
  %51 = fmul <2 x double> %50, %broadcast.splat92
  %52 = load double, double* %32, align 8, !alias.scope !13
  %53 = insertelement <2 x double> undef, double %52, i32 0
  %54 = shufflevector <2 x double> %53, <2 x double> undef, <2 x i32> zeroinitializer
  %55 = fmul <2 x double> %51, %54
  %56 = fadd <2 x double> %44, %55
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %index84
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !15, !noalias !17
  %59 = fadd <2 x double> %wide.load93, %56
  %60 = bitcast double* %57 to <2 x double>*
  store <2 x double> %59, <2 x double>* %60, align 8, !alias.scope !15, !noalias !17
  %index.next85 = add i64 %index84, 2
  %61 = icmp eq i64 %index.next85, %n.vec55
  br i1 %61, label %middle.block50, label %vector.body49, !llvm.loop !18

middle.block50:                                   ; preds = %vector.body49
  br i1 %cmp.n87, label %._crit_edge.us18, label %scalar.ph51.preheader

.lr.ph.us:                                        ; preds = %._crit_edge9.us, %.preheader4.lr.ph..preheader4.us_crit_edge
  %indvars.iv34 = phi i64 [ 0, %.preheader4.lr.ph..preheader4.us_crit_edge ], [ %indvars.iv.next35, %._crit_edge9.us ]
  %62 = add i64 %indvars.iv34, -3
  %63 = lshr i64 %62, 2
  %64 = add nuw nsw i64 %indvars.iv34, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 0
  %65 = mul nuw nsw i64 %indvars.iv34, 1201
  %66 = add nuw nsw i64 %65, 1
  %scevgep59 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %66
  %67 = add nuw nsw i64 %indvars.iv34, 1
  %min.iters.check97 = icmp ult i64 %64, 4
  br i1 %min.iters.check97, label %scalar.ph96.preheader, label %min.iters.checked98

scalar.ph96.preheader:                            ; preds = %middle.block95, %min.iters.checked98, %.lr.ph.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked98 ], [ 0, %.lr.ph.us ], [ %n.vec100, %middle.block95 ]
  br label %scalar.ph96

min.iters.checked98:                              ; preds = %.lr.ph.us
  %n.vec100 = and i64 %64, -4
  %cmp.zero101 = icmp eq i64 %n.vec100, 0
  br i1 %cmp.zero101, label %scalar.ph96.preheader, label %vector.ph102

vector.ph102:                                     ; preds = %min.iters.checked98
  %68 = and i64 %63, 1
  %lcmp.mod = icmp eq i64 %68, 0
  br i1 %lcmp.mod, label %vector.body94.prol.preheader, label %vector.body94.prol.loopexit.unr-lcssa

vector.body94.prol.preheader:                     ; preds = %vector.ph102
  br label %vector.body94.prol

vector.body94.prol:                               ; preds = %vector.body94.prol.preheader
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 0
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load111.prol = load <2 x double>, <2 x double>* %70, align 8
  %71 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load112.prol = load <2 x double>, <2 x double>* %72, align 8
  %73 = fmul <2 x double> %wide.load111.prol, %broadcast.splat114
  %74 = fmul <2 x double> %wide.load112.prol, %broadcast.splat114
  %75 = bitcast double* %69 to <2 x double>*
  store <2 x double> %73, <2 x double>* %75, align 8
  %76 = bitcast double* %71 to <2 x double>*
  store <2 x double> %74, <2 x double>* %76, align 8
  br label %vector.body94.prol.loopexit.unr-lcssa

vector.body94.prol.loopexit.unr-lcssa:            ; preds = %vector.ph102, %vector.body94.prol
  %index103.unr.ph = phi i64 [ 4, %vector.body94.prol ], [ 0, %vector.ph102 ]
  br label %vector.body94.prol.loopexit

vector.body94.prol.loopexit:                      ; preds = %vector.body94.prol.loopexit.unr-lcssa
  %77 = icmp eq i64 %63, 0
  br i1 %77, label %middle.block95, label %vector.ph102.new

vector.ph102.new:                                 ; preds = %vector.body94.prol.loopexit
  br label %vector.body94

vector.body94:                                    ; preds = %vector.body94, %vector.ph102.new
  %index103 = phi i64 [ %index103.unr.ph, %vector.ph102.new ], [ %index.next104.1, %vector.body94 ]
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %index103
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load111 = load <2 x double>, <2 x double>* %79, align 8
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %81, align 8
  %82 = fmul <2 x double> %wide.load111, %broadcast.splat114
  %83 = fmul <2 x double> %wide.load112, %broadcast.splat114
  %84 = bitcast double* %78 to <2 x double>*
  store <2 x double> %82, <2 x double>* %84, align 8
  %85 = bitcast double* %80 to <2 x double>*
  store <2 x double> %83, <2 x double>* %85, align 8
  %index.next104 = add i64 %index103, 4
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %index.next104
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load111.1 = load <2 x double>, <2 x double>* %87, align 8
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load112.1 = load <2 x double>, <2 x double>* %89, align 8
  %90 = fmul <2 x double> %wide.load111.1, %broadcast.splat114
  %91 = fmul <2 x double> %wide.load112.1, %broadcast.splat114
  %92 = bitcast double* %86 to <2 x double>*
  store <2 x double> %90, <2 x double>* %92, align 8
  %93 = bitcast double* %88 to <2 x double>*
  store <2 x double> %91, <2 x double>* %93, align 8
  %index.next104.1 = add i64 %index103, 8
  %94 = icmp eq i64 %index.next104.1, %n.vec100
  br i1 %94, label %middle.block95.unr-lcssa, label %vector.body94, !llvm.loop !19

middle.block95.unr-lcssa:                         ; preds = %vector.body94
  br label %middle.block95

middle.block95:                                   ; preds = %vector.body94.prol.loopexit, %middle.block95.unr-lcssa
  %cmp.n106 = icmp eq i64 %64, %n.vec100
  br i1 %cmp.n106, label %.preheader.us15.preheader, label %scalar.ph96.preheader

.preheader.us15.preheader.loopexit:               ; preds = %scalar.ph96
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %.preheader.us15.preheader.loopexit, %middle.block95
  %min.iters.check52 = icmp ult i64 %67, 2
  %n.vec55 = and i64 %67, -2
  %cmp.zero56 = icmp eq i64 %n.vec55, 0
  %cmp.n87 = icmp eq i64 %67, %n.vec55
  br label %.preheader.us15

._crit_edge.us18.loopexit:                        ; preds = %scalar.ph51
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %middle.block50
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next32, %11
  br i1 %exitcond116, label %._crit_edge9.us, label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next35, %12
  br i1 %exitcond117, label %._crit_edge13.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.preheader3, %.preheader4.lr.ph..preheader4_crit_edge
  %indvars.iv41 = phi i64 [ 0, %.preheader4.lr.ph..preheader4_crit_edge ], [ %indvars.iv.next42, %.preheader3 ]
  %95 = add i64 %indvars.iv41, -3
  %96 = lshr i64 %95, 2
  %97 = add nuw nsw i64 %indvars.iv41, 1
  %min.iters.check = icmp ult i64 %97, 4
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %n.vec = and i64 %97, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %98 = and i64 %96, 1
  %lcmp.mod120 = icmp eq i64 %98, 0
  br i1 %lcmp.mod120, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 0
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load.prol = load <2 x double>, <2 x double>* %100, align 8
  %101 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 2
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load46.prol = load <2 x double>, <2 x double>* %102, align 8
  %103 = fmul <2 x double> %wide.load.prol, %broadcast.splat48
  %104 = fmul <2 x double> %wide.load46.prol, %broadcast.splat48
  %105 = bitcast double* %99 to <2 x double>*
  store <2 x double> %103, <2 x double>* %105, align 8
  %106 = bitcast double* %101 to <2 x double>*
  store <2 x double> %104, <2 x double>* %106, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.ph, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %107 = icmp eq i64 %96, 0
  br i1 %107, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %index
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %109, align 8
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %111, align 8
  %112 = fmul <2 x double> %wide.load, %broadcast.splat48
  %113 = fmul <2 x double> %wide.load46, %broadcast.splat48
  %114 = bitcast double* %108 to <2 x double>*
  store <2 x double> %112, <2 x double>* %114, align 8
  %115 = bitcast double* %110 to <2 x double>*
  store <2 x double> %113, <2 x double>* %115, align 8
  %index.next = add i64 %index, 4
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %index.next
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %117, align 8
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load46.1 = load <2 x double>, <2 x double>* %119, align 8
  %120 = fmul <2 x double> %wide.load.1, %broadcast.splat48
  %121 = fmul <2 x double> %wide.load46.1, %broadcast.splat48
  %122 = bitcast double* %116 to <2 x double>*
  store <2 x double> %120, <2 x double>* %122, align 8
  %123 = bitcast double* %118 to <2 x double>*
  store <2 x double> %121, <2 x double>* %123, align 8
  %index.next.1 = add i64 %index, 8
  %124 = icmp eq i64 %index.next.1, %n.vec
  br i1 %124, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %97, %n.vec
  br i1 %cmp.n, label %.preheader3, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph
  %indvars.iv36.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %scalar.ph ], [ %indvars.iv36.ph, %scalar.ph.preheader ]
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv36
  %126 = load double, double* %125, align 8
  %127 = fmul double %126, %3
  store double %127, double* %125, align 8
  %exitcond40 = icmp eq i64 %indvars.iv36, %indvars.iv41
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  br i1 %exitcond40, label %.preheader3.loopexit, label %scalar.ph, !llvm.loop !21

.preheader3.loopexit:                             ; preds = %scalar.ph
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %middle.block
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next42, %10
  br i1 %exitcond118, label %._crit_edge13.loopexit115, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge13

._crit_edge13.loopexit115:                        ; preds = %.preheader3
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit115, %._crit_edge13.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %..preheader.us_crit_edge, label %._crit_edge4

..preheader.us_crit_edge:                         ; preds = %2
  %8 = sext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv6 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next7, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv6, %8
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge5
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge5, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %8
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge5

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, %8
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #6 = { cold nounwind }

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
!19 = distinct !{!19, !3, !4}
!20 = distinct !{!20, !3, !4}
!21 = distinct !{!21, !2, !3, !4}
