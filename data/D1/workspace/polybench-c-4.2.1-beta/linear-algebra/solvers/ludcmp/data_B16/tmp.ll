; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %6

; <label>:6:                                      ; preds = %6, %5
  %indvars.iv137 = phi i64 [ 0, %5 ], [ %indvars.iv.next138.1, %6 ]
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv137
  %8 = bitcast double* %7 to <2 x double>*
  %9 = getelementptr inbounds double, double* %4, i64 %indvars.iv137
  %10 = bitcast double* %9 to <2 x double>*
  %11 = trunc i64 %indvars.iv137 to i32
  %12 = or i32 %11, 1
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %2, i64 %indvars.iv137
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  store <2 x double> zeroinitializer, <2 x double>* %10, align 8
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv137, 2
  %15 = trunc i64 %indvars.iv.next138.1 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %13, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 2.000000e+03, double 2.000000e+03>
  %20 = fmul <2 x double> %19, <double 5.000000e-01, double 5.000000e-01>
  %21 = fadd <2 x double> %20, <double 4.000000e+00, double 4.000000e+00>
  %22 = bitcast double* %14 to <2 x double>*
  store <2 x double> %21, <2 x double>* %22, align 8
  %exitcond139.1 = icmp eq i64 %indvars.iv.next138.1, 2000
  br i1 %exitcond139.1, label %.lr.ph.preheader, label %6

.lr.ph.preheader:                                 ; preds = %6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.backedge, %.lr.ph.preheader
  %indvars.iv134 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next135, %.lr.ph.backedge ]
  %23 = mul nuw nsw i64 %indvars.iv134, 2001
  %24 = add nuw nsw i64 %23, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %24
  %scevgep133 = bitcast double* %scevgep to i8*
  %25 = sub i64 1998, %indvars.iv134
  %26 = shl i64 %25, 3
  %27 = and i64 %26, 34359738360
  %28 = add nuw nsw i64 %27, 8
  br label %29

; <label>:29:                                     ; preds = %29, %.lr.ph
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %29 ], [ 0, %.lr.ph ]
  %30 = sub nsw i64 0, %indvars.iv117
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 2000
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 2.000000e+03
  %35 = fadd double %34, 1.000000e+00
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv117
  store double %35, double* %36, align 8
  %exitcond125 = icmp eq i64 %indvars.iv117, %indvars.iv134
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  br i1 %exitcond125, label %._crit_edge, label %29

._crit_edge:                                      ; preds = %29
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %37 = icmp slt i64 %indvars.iv.next135, 2000
  br i1 %37, label %._crit_edge99.thread, label %._crit_edge99

._crit_edge99.thread:                             ; preds = %._crit_edge
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep133, i8 0, i64 %28, i32 8, i1 false)
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv134
  store double 1.000000e+00, double* %38, align 8
  br label %.lr.ph.backedge

._crit_edge99:                                    ; preds = %._crit_edge
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv134
  store double 1.000000e+00, double* %39, align 8
  %exitcond136 = icmp eq i64 %indvars.iv.next135, 2000
  br i1 %exitcond136, label %.preheader84, label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge99, %._crit_edge99.thread
  br label %.lr.ph

.preheader84:                                     ; preds = %._crit_edge99
  %40 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %40, i8 0, i64 32000000, i32 8, i1 false)
  %41 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %.preheader83

.preheader83:                                     ; preds = %63, %.preheader84
  %.07392 = phi i32 [ 0, %.preheader84 ], [ %64, %63 ]
  %42 = sext i32 %.07392 to i64
  br label %.preheader82

.preheader82:                                     ; preds = %60, %.preheader83
  %.17791 = phi i32 [ 0, %.preheader83 ], [ %61, %60 ]
  %43 = sext i32 %.17791 to i64
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %43, i64 %42
  br label %45

; <label>:45:                                     ; preds = %45, %.preheader82
  %indvars.iv108 = phi i64 [ 0, %.preheader82 ], [ %indvars.iv.next109.1, %45 ]
  %46 = load double, double* %44, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %42
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %43, i64 %indvars.iv108
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %53 = load double, double* %44, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next109, i64 %42
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %43, i64 %indvars.iv.next109
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %57, align 8
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  %exitcond110.1 = icmp eq i64 %indvars.iv.next109.1, 2000
  br i1 %exitcond110.1, label %60, label %45

; <label>:60:                                     ; preds = %45
  %61 = add nsw i32 %.17791, 1
  %62 = icmp slt i32 %61, 2000
  br i1 %62, label %.preheader82, label %63

; <label>:63:                                     ; preds = %60
  %64 = add nsw i32 %.07392, 1
  %65 = icmp slt i32 %64, 2000
  br i1 %65, label %.preheader83, label %.preheader.preheader

.preheader.preheader:                             ; preds = %63
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %93
  %indvar = phi i64 [ %indvar.next, %93 ], [ 0, %.preheader.preheader ]
  %.27889 = phi i64 [ %94, %93 ], [ 0, %.preheader.preheader ]
  %sext = shl i64 %.27889, 32
  %66 = ashr exact i64 %sext, 32
  br label %67

; <label>:67:                                     ; preds = %67, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %67 ]
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %66, i64 %indvars.iv
  %69 = bitcast double* %68 to i64*
  %70 = load i64, i64* %69, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %66, i64 %indvars.iv
  %72 = bitcast double* %71 to i64*
  store i64 %70, i64* %72, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %66, i64 %indvars.iv.next
  %74 = bitcast double* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %66, i64 %indvars.iv.next
  %77 = bitcast double* %76 to i64*
  store i64 %75, i64* %77, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %66, i64 %indvars.iv.next.1
  %79 = bitcast double* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %66, i64 %indvars.iv.next.1
  %82 = bitcast double* %81 to i64*
  store i64 %80, i64* %82, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %66, i64 %indvars.iv.next.2
  %84 = bitcast double* %83 to i64*
  %85 = load i64, i64* %84, align 8
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %66, i64 %indvars.iv.next.2
  %87 = bitcast double* %86 to i64*
  store i64 %85, i64* %87, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %66, i64 %indvars.iv.next.3
  %89 = bitcast double* %88 to i64*
  %90 = load i64, i64* %89, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %66, i64 %indvars.iv.next.3
  %92 = bitcast double* %91 to i64*
  store i64 %90, i64* %92, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %93, label %67

; <label>:93:                                     ; preds = %67
  %94 = add nsw i64 %66, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 2000
  br i1 %exitcond, label %95, label %.preheader

; <label>:95:                                     ; preds = %93
  tail call void @free(i8* nonnull %40) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader102

.preheader102:                                    ; preds = %._crit_edge128, %5
  %indvars.iv180 = phi i64 [ %indvars.iv.next181, %._crit_edge128 ], [ 0, %5 ]
  %6 = add i64 %indvars.iv180, 4294967295
  %7 = sub i64 2000, %indvars.iv180
  %8 = trunc i64 %7 to i32
  %9 = sub i64 1999, %indvars.iv180
  %10 = trunc i64 %9 to i32
  %11 = icmp sgt i64 %indvars.iv180, 0
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180
  br i1 %11, label %.lr.ph119, label %.lr.ph127..lr.ph127.split_crit_edge

.lr.ph119:                                        ; preds = %.preheader102
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 0
  %14 = ptrtoint [2000 x double]* %12 to i64
  br label %49

.lr.ph127:                                        ; preds = %._crit_edge116
  br i1 true, label %.lr.ph127..lr.ph127.split.us_crit_edge, label %.lr.ph127..lr.ph127..lr.ph127.split_crit_edge_crit_edge

.lr.ph127..lr.ph127..lr.ph127.split_crit_edge_crit_edge: ; preds = %.lr.ph127
  br label %.lr.ph127..lr.ph127.split_crit_edge

.lr.ph127..lr.ph127.split_crit_edge:              ; preds = %.lr.ph127..lr.ph127..lr.ph127.split_crit_edge_crit_edge, %.preheader102
  %xtraiter168 = and i32 %8, 3
  %lcmp.mod169 = icmp eq i32 %xtraiter168, 0
  br i1 %lcmp.mod169, label %.lr.ph127.split.prol.loopexit, label %.lr.ph127.split.prol.preheader

.lr.ph127.split.prol.preheader:                   ; preds = %.lr.ph127..lr.ph127.split_crit_edge
  %15 = ptrtoint [2000 x double]* %12 to i64
  br label %.lr.ph127.split.prol

.lr.ph127.split.prol:                             ; preds = %.lr.ph127.split.prol.preheader, %.lr.ph127.split.prol
  %indvars.iv165.prol = phi i64 [ %indvars.iv.next166.prol, %.lr.ph127.split.prol ], [ %indvars.iv180, %.lr.ph127.split.prol.preheader ]
  %prol.iter170 = phi i32 [ %prol.iter170.sub, %.lr.ph127.split.prol ], [ %xtraiter168, %.lr.ph127.split.prol.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %indvars.iv165.prol
  %17 = bitcast double* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %sunkaddr97.prol = shl nsw i64 %indvars.iv165.prol, 3
  %sunkaddr98.prol = add i64 %sunkaddr97.prol, %15
  %19 = inttoptr i64 %sunkaddr98.prol to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next166.prol = add nuw nsw i64 %indvars.iv165.prol, 1
  %prol.iter170.sub = add i32 %prol.iter170, -1
  %prol.iter170.cmp = icmp eq i32 %prol.iter170.sub, 0
  br i1 %prol.iter170.cmp, label %.lr.ph127.split.prol.loopexit.loopexit, label %.lr.ph127.split.prol, !llvm.loop !1

.lr.ph127.split.prol.loopexit.loopexit:           ; preds = %.lr.ph127.split.prol
  br label %.lr.ph127.split.prol.loopexit

.lr.ph127.split.prol.loopexit:                    ; preds = %.lr.ph127.split.prol.loopexit.loopexit, %.lr.ph127..lr.ph127.split_crit_edge
  %indvars.iv165.unr = phi i64 [ %indvars.iv180, %.lr.ph127..lr.ph127.split_crit_edge ], [ %indvars.iv.next166.prol, %.lr.ph127.split.prol.loopexit.loopexit ]
  %20 = icmp ult i32 %10, 3
  br i1 %20, label %._crit_edge128, label %.lr.ph127.split.preheader

.lr.ph127.split.preheader:                        ; preds = %.lr.ph127.split.prol.loopexit
  %21 = ptrtoint [2000 x double]* %12 to i64
  br label %.lr.ph127.split

.lr.ph127..lr.ph127.split.us_crit_edge:           ; preds = %.lr.ph127
  %22 = trunc i64 %indvars.iv180 to i32
  %xtraiter176183 = and i64 %indvars.iv180, 1
  %lcmp.mod177 = icmp eq i64 %xtraiter176183, 0
  %23 = trunc i64 %6 to i32
  %24 = icmp eq i32 %23, 0
  br label %.lr.ph127.split.us

.lr.ph127.split.us:                               ; preds = %._crit_edge124.us, %.lr.ph127..lr.ph127.split.us_crit_edge
  %.187126.us = phi i32 [ %22, %.lr.ph127..lr.ph127.split.us_crit_edge ], [ %47, %._crit_edge124.us ]
  %25 = sext i32 %.187126.us to i64
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %25
  %27 = load double, double* %26, align 8
  br i1 %lcmp.mod177, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph127.split.us
  %28 = load double, double* %13, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %25
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %27, %31
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph127.split.us
  %indvars.iv171.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph127.split.us ]
  %.1121.us.unr.ph = phi double [ %32, %.prol.preheader ], [ %27, %.lr.ph127.split.us ]
  %.lcssa137.unr.ph = phi double [ %32, %.prol.preheader ], [ undef, %.lr.ph127.split.us ]
  br i1 %24, label %._crit_edge124.us, label %.lr.ph127.split.us.new.preheader

.lr.ph127.split.us.new.preheader:                 ; preds = %.prol.loopexit
  br label %.lr.ph127.split.us.new

.lr.ph127.split.us.new:                           ; preds = %.lr.ph127.split.us.new.preheader, %.lr.ph127.split.us.new
  %indvars.iv171 = phi i64 [ %indvars.iv.next172.1, %.lr.ph127.split.us.new ], [ %indvars.iv171.unr.ph, %.lr.ph127.split.us.new.preheader ]
  %.1121.us = phi double [ %46, %.lr.ph127.split.us.new ], [ %.1121.us.unr.ph, %.lr.ph127.split.us.new.preheader ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %indvars.iv171
  %34 = bitcast double* %33 to <2 x double>*
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv171, i64 %25
  %36 = load double, double* %35, align 8
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %37 = load <2 x double>, <2 x double>* %34, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next172, i64 %25
  %39 = load double, double* %38, align 8
  %40 = insertelement <2 x double> undef, double %36, i32 0
  %41 = insertelement <2 x double> %40, double %39, i32 1
  %42 = fmul <2 x double> %37, %41
  %43 = extractelement <2 x double> %42, i32 0
  %44 = extractelement <2 x double> %42, i32 1
  %45 = fsub double %.1121.us, %43
  %46 = fsub double %45, %44
  %indvars.iv.next172.1 = add nsw i64 %indvars.iv171, 2
  %exitcond175.1 = icmp eq i64 %indvars.iv.next172.1, %indvars.iv180
  br i1 %exitcond175.1, label %._crit_edge124.us.loopexit, label %.lr.ph127.split.us.new

._crit_edge124.us.loopexit:                       ; preds = %.lr.ph127.split.us.new
  br label %._crit_edge124.us

._crit_edge124.us:                                ; preds = %._crit_edge124.us.loopexit, %.prol.loopexit
  %.lcssa137 = phi double [ %.lcssa137.unr.ph, %.prol.loopexit ], [ %46, %._crit_edge124.us.loopexit ]
  %sunkaddr97.us = shl nsw i64 %25, 3
  %sunkaddr98.us = add i64 %sunkaddr97.us, %14
  %sunkaddr99.us = inttoptr i64 %sunkaddr98.us to double*
  store double %.lcssa137, double* %sunkaddr99.us, align 8
  %47 = add nsw i32 %.187126.us, 1
  %48 = icmp slt i32 %47, 2000
  br i1 %48, label %.lr.ph127.split.us, label %._crit_edge128.loopexit

; <label>:49:                                     ; preds = %._crit_edge116, %.lr.ph119
  %indvars.iv161 = phi i64 [ %indvars.iv.next162, %._crit_edge116 ], [ 0, %.lr.ph119 ]
  %50 = add i64 %indvars.iv161, 4294967295
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %indvars.iv161
  %52 = load double, double* %51, align 8
  %53 = icmp sgt i64 %indvars.iv161, 0
  br i1 %53, label %..lr.ph115_crit_edge, label %._crit_edge116

..lr.ph115_crit_edge:                             ; preds = %49
  %xtraiter156184 = and i64 %indvars.iv161, 1
  %lcmp.mod157 = icmp eq i64 %xtraiter156184, 0
  br i1 %lcmp.mod157, label %.lr.ph115.prol.loopexit, label %.lr.ph115.prol

.lr.ph115.prol:                                   ; preds = %..lr.ph115_crit_edge
  %54 = load double, double* %13, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv161
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fsub double %52, %57
  br label %.lr.ph115.prol.loopexit

.lr.ph115.prol.loopexit:                          ; preds = %.lr.ph115.prol, %..lr.ph115_crit_edge
  %indvars.iv151.unr.ph = phi i64 [ 1, %.lr.ph115.prol ], [ 0, %..lr.ph115_crit_edge ]
  %.0113.unr.ph = phi double [ %58, %.lr.ph115.prol ], [ %52, %..lr.ph115_crit_edge ]
  %.lcssa136.unr.ph = phi double [ %58, %.lr.ph115.prol ], [ undef, %..lr.ph115_crit_edge ]
  %59 = trunc i64 %50 to i32
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %._crit_edge116, label %.lr.ph115.preheader

.lr.ph115.preheader:                              ; preds = %.lr.ph115.prol.loopexit
  br label %.lr.ph115

.lr.ph115:                                        ; preds = %.lr.ph115.preheader, %.lr.ph115
  %indvars.iv151 = phi i64 [ %indvars.iv.next152.1, %.lr.ph115 ], [ %indvars.iv151.unr.ph, %.lr.ph115.preheader ]
  %.0113 = phi double [ %74, %.lr.ph115 ], [ %.0113.unr.ph, %.lr.ph115.preheader ]
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %indvars.iv151
  %62 = bitcast double* %61 to <2 x double>*
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv151, i64 %indvars.iv161
  %64 = load double, double* %63, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %65 = load <2 x double>, <2 x double>* %62, align 8
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next152, i64 %indvars.iv161
  %67 = load double, double* %66, align 8
  %68 = insertelement <2 x double> undef, double %64, i32 0
  %69 = insertelement <2 x double> %68, double %67, i32 1
  %70 = fmul <2 x double> %65, %69
  %71 = extractelement <2 x double> %70, i32 0
  %72 = extractelement <2 x double> %70, i32 1
  %73 = fsub double %.0113, %71
  %74 = fsub double %73, %72
  %indvars.iv.next152.1 = add nsw i64 %indvars.iv151, 2
  %exitcond153.1 = icmp eq i64 %indvars.iv.next152.1, %indvars.iv161
  br i1 %exitcond153.1, label %._crit_edge116.loopexit, label %.lr.ph115

._crit_edge116.loopexit:                          ; preds = %.lr.ph115
  br label %._crit_edge116

._crit_edge116:                                   ; preds = %._crit_edge116.loopexit, %.lr.ph115.prol.loopexit, %49
  %.0.lcssa = phi double [ %52, %49 ], [ %.lcssa136.unr.ph, %.lr.ph115.prol.loopexit ], [ %74, %._crit_edge116.loopexit ]
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv161, i64 %indvars.iv161
  %76 = load double, double* %75, align 8
  %77 = fdiv double %.0.lcssa, %76
  %sunkaddr93 = shl nsw i64 %indvars.iv161, 3
  %sunkaddr94 = add i64 %sunkaddr93, %14
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to double*
  store double %77, double* %sunkaddr95, align 8
  %indvars.iv.next162 = add nuw nsw i64 %indvars.iv161, 1
  %exitcond160 = icmp eq i64 %indvars.iv.next162, %indvars.iv180
  br i1 %exitcond160, label %.lr.ph127, label %49

.lr.ph127.split:                                  ; preds = %.lr.ph127.split.preheader, %.lr.ph127.split
  %indvars.iv165 = phi i64 [ %indvars.iv.next166.3, %.lr.ph127.split ], [ %indvars.iv165.unr, %.lr.ph127.split.preheader ]
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %indvars.iv165
  %79 = bitcast double* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %sunkaddr97 = shl nsw i64 %indvars.iv165, 3
  %sunkaddr98 = add i64 %sunkaddr97, %21
  %81 = inttoptr i64 %sunkaddr98 to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next166 = add nuw nsw i64 %indvars.iv165, 1
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %indvars.iv.next166
  %83 = bitcast double* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %sunkaddr97.1 = shl nsw i64 %indvars.iv.next166, 3
  %sunkaddr98.1 = add i64 %sunkaddr97.1, %21
  %85 = inttoptr i64 %sunkaddr98.1 to i64*
  store i64 %84, i64* %85, align 8
  %indvars.iv.next166.1 = add nsw i64 %indvars.iv165, 2
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %indvars.iv.next166.1
  %87 = bitcast double* %86 to i64*
  %88 = load i64, i64* %87, align 8
  %sunkaddr97.2 = shl nsw i64 %indvars.iv.next166.1, 3
  %sunkaddr98.2 = add i64 %sunkaddr97.2, %21
  %89 = inttoptr i64 %sunkaddr98.2 to i64*
  store i64 %88, i64* %89, align 8
  %indvars.iv.next166.2 = add nsw i64 %indvars.iv165, 3
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %indvars.iv.next166.2
  %91 = bitcast double* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %sunkaddr97.3 = shl nsw i64 %indvars.iv.next166.2, 3
  %sunkaddr98.3 = add i64 %sunkaddr97.3, %21
  %93 = inttoptr i64 %sunkaddr98.3 to i64*
  store i64 %92, i64* %93, align 8
  %indvars.iv.next166.3 = add nsw i64 %indvars.iv165, 4
  %exitcond167.3 = icmp eq i64 %indvars.iv.next166.3, 2000
  br i1 %exitcond167.3, label %._crit_edge128.loopexit197, label %.lr.ph127.split

._crit_edge128.loopexit:                          ; preds = %._crit_edge124.us
  br label %._crit_edge128

._crit_edge128.loopexit197:                       ; preds = %.lr.ph127.split
  br label %._crit_edge128

._crit_edge128:                                   ; preds = %._crit_edge128.loopexit197, %._crit_edge128.loopexit, %.lr.ph127.split.prol.loopexit
  %indvars.iv.next181 = add nuw nsw i64 %indvars.iv180, 1
  %exitcond182 = icmp eq i64 %indvars.iv.next181, 2000
  br i1 %exitcond182, label %.preheader100.preheader, label %.preheader102

.preheader100.preheader:                          ; preds = %._crit_edge128
  br label %.preheader100

.preheader100:                                    ; preds = %.preheader100.preheader, %._crit_edge109
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge109 ], [ 0, %.preheader100.preheader ]
  %94 = add i64 %indvars.iv149, 4294967295
  %95 = getelementptr inbounds double, double* %2, i64 %indvars.iv149
  %96 = load double, double* %95, align 8
  %97 = icmp sgt i64 %indvars.iv149, 0
  br i1 %97, label %.preheader100..lr.ph108_crit_edge, label %._crit_edge109

.preheader100..lr.ph108_crit_edge:                ; preds = %.preheader100
  %98 = trunc i64 %indvars.iv149 to i32
  %xtraiter144 = and i32 %98, 3
  %lcmp.mod145 = icmp eq i32 %xtraiter144, 0
  br i1 %lcmp.mod145, label %.lr.ph108.prol.loopexit, label %.lr.ph108.prol.preheader

.lr.ph108.prol.preheader:                         ; preds = %.preheader100..lr.ph108_crit_edge
  br label %.lr.ph108.prol

.lr.ph108.prol:                                   ; preds = %.lr.ph108.prol.preheader, %.lr.ph108.prol
  %indvars.iv140.prol = phi i64 [ %indvars.iv.next141.prol, %.lr.ph108.prol ], [ 0, %.lr.ph108.prol.preheader ]
  %.2106.prol = phi double [ %104, %.lr.ph108.prol ], [ %96, %.lr.ph108.prol.preheader ]
  %prol.iter147 = phi i32 [ %prol.iter147.sub, %.lr.ph108.prol ], [ %xtraiter144, %.lr.ph108.prol.preheader ]
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140.prol
  %100 = load double, double* %99, align 8
  %101 = getelementptr inbounds double, double* %4, i64 %indvars.iv140.prol
  %102 = load double, double* %101, align 8
  %103 = fmul double %100, %102
  %104 = fsub double %.2106.prol, %103
  %indvars.iv.next141.prol = add nuw nsw i64 %indvars.iv140.prol, 1
  %prol.iter147.sub = add i32 %prol.iter147, -1
  %prol.iter147.cmp = icmp eq i32 %prol.iter147.sub, 0
  br i1 %prol.iter147.cmp, label %.lr.ph108.prol.loopexit.loopexit, label %.lr.ph108.prol, !llvm.loop !3

.lr.ph108.prol.loopexit.loopexit:                 ; preds = %.lr.ph108.prol
  br label %.lr.ph108.prol.loopexit

.lr.ph108.prol.loopexit:                          ; preds = %.lr.ph108.prol.loopexit.loopexit, %.preheader100..lr.ph108_crit_edge
  %indvars.iv140.unr = phi i64 [ 0, %.preheader100..lr.ph108_crit_edge ], [ %indvars.iv.next141.prol, %.lr.ph108.prol.loopexit.loopexit ]
  %.2106.unr = phi double [ %96, %.preheader100..lr.ph108_crit_edge ], [ %104, %.lr.ph108.prol.loopexit.loopexit ]
  %.lcssa135.unr = phi double [ undef, %.preheader100..lr.ph108_crit_edge ], [ %104, %.lr.ph108.prol.loopexit.loopexit ]
  %105 = trunc i64 %94 to i32
  %106 = icmp ult i32 %105, 3
  br i1 %106, label %._crit_edge109, label %.lr.ph108.preheader

.lr.ph108.preheader:                              ; preds = %.lr.ph108.prol.loopexit
  br label %.lr.ph108

.lr.ph108:                                        ; preds = %.lr.ph108.preheader, %.lr.ph108
  %indvars.iv140 = phi i64 [ %indvars.iv.next141.3, %.lr.ph108 ], [ %indvars.iv140.unr, %.lr.ph108.preheader ]
  %.2106 = phi double [ %128, %.lr.ph108 ], [ %.2106.unr, %.lr.ph108.preheader ]
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140
  %108 = bitcast double* %107 to <2 x double>*
  %109 = getelementptr inbounds double, double* %4, i64 %indvars.iv140
  %110 = bitcast double* %109 to <2 x double>*
  %111 = load <2 x double>, <2 x double>* %108, align 8
  %112 = load <2 x double>, <2 x double>* %110, align 8
  %113 = fmul <2 x double> %111, %112
  %114 = extractelement <2 x double> %113, i32 0
  %115 = extractelement <2 x double> %113, i32 1
  %116 = fsub double %.2106, %114
  %117 = fsub double %116, %115
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv.next141.1
  %119 = bitcast double* %118 to <2 x double>*
  %120 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next141.1
  %121 = bitcast double* %120 to <2 x double>*
  %122 = load <2 x double>, <2 x double>* %119, align 8
  %123 = load <2 x double>, <2 x double>* %121, align 8
  %124 = fmul <2 x double> %122, %123
  %125 = extractelement <2 x double> %124, i32 0
  %126 = extractelement <2 x double> %124, i32 1
  %127 = fsub double %117, %125
  %128 = fsub double %127, %126
  %indvars.iv.next141.3 = add nsw i64 %indvars.iv140, 4
  %exitcond.3148 = icmp eq i64 %indvars.iv.next141.3, %indvars.iv149
  br i1 %exitcond.3148, label %._crit_edge109.loopexit, label %.lr.ph108

._crit_edge109.loopexit:                          ; preds = %.lr.ph108
  br label %._crit_edge109

._crit_edge109:                                   ; preds = %._crit_edge109.loopexit, %.lr.ph108.prol.loopexit, %.preheader100
  %.2.lcssa = phi double [ %96, %.preheader100 ], [ %.lcssa135.unr, %.lr.ph108.prol.loopexit ], [ %128, %._crit_edge109.loopexit ]
  %129 = getelementptr inbounds double, double* %4, i64 %indvars.iv149
  store double %.2.lcssa, double* %129, align 8
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %exitcond = icmp eq i64 %indvars.iv.next150, 2000
  br i1 %exitcond, label %.preheader.preheader, label %.preheader100

.preheader.preheader:                             ; preds = %._crit_edge109
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvar = phi i32 [ %indvar.next, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge..preheader_crit_edge ], [ 2000, %.preheader.preheader ]
  %.292104 = phi i32 [ %175, %._crit_edge..preheader_crit_edge ], [ 1999, %.preheader.preheader ]
  %130 = add i32 %indvar, -1
  %131 = sext i32 %indvars.iv to i64
  %132 = sext i32 %.292104 to i64
  %133 = getelementptr inbounds double, double* %4, i64 %132
  %134 = load double, double* %133, align 8
  %135 = add nsw i32 %.292104, 1
  %136 = icmp slt i32 %135, 2000
  br i1 %136, label %.preheader..lr.ph_crit_edge, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %.preheader
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %132, i64 %132
  %138 = load double, double* %137, align 8
  %139 = fdiv double %134, %138
  %140 = getelementptr inbounds double, double* %3, i64 %132
  store double %139, double* %140, align 8
  br label %._crit_edge..preheader_crit_edge

.preheader..lr.ph_crit_edge:                      ; preds = %.preheader
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.preheader..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv138.prol = phi i64 [ %indvars.iv.next139.prol, %.lr.ph.prol ], [ %131, %.lr.ph.prol.preheader ]
  %.3103.prol = phi double [ %146, %.lr.ph.prol ], [ %134, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %132, i64 %indvars.iv138.prol
  %142 = load double, double* %141, align 8
  %143 = getelementptr inbounds double, double* %3, i64 %indvars.iv138.prol
  %144 = load double, double* %143, align 8
  %145 = fmul double %142, %144
  %146 = fsub double %.3103.prol, %145
  %indvars.iv.next139.prol = add nsw i64 %indvars.iv138.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !4

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.preheader..lr.ph_crit_edge
  %indvars.iv138.unr = phi i64 [ %131, %.preheader..lr.ph_crit_edge ], [ %indvars.iv.next139.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.3103.unr = phi double [ %134, %.preheader..lr.ph_crit_edge ], [ %146, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.preheader..lr.ph_crit_edge ], [ %146, %.lr.ph.prol.loopexit.loopexit ]
  %147 = icmp ult i32 %130, 3
  br i1 %147, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv138 = phi i64 [ %indvars.iv.next139.3, %.lr.ph ], [ %indvars.iv138.unr, %.lr.ph.preheader ]
  %.3103 = phi double [ %169, %.lr.ph ], [ %.3103.unr, %.lr.ph.preheader ]
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %132, i64 %indvars.iv138
  %149 = bitcast double* %148 to <2 x double>*
  %150 = getelementptr inbounds double, double* %3, i64 %indvars.iv138
  %151 = bitcast double* %150 to <2 x double>*
  %152 = load <2 x double>, <2 x double>* %149, align 8
  %153 = load <2 x double>, <2 x double>* %151, align 8
  %154 = fmul <2 x double> %152, %153
  %155 = extractelement <2 x double> %154, i32 0
  %156 = extractelement <2 x double> %154, i32 1
  %157 = fsub double %.3103, %155
  %158 = fsub double %157, %156
  %indvars.iv.next139.1 = add nsw i64 %indvars.iv138, 2
  %159 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %132, i64 %indvars.iv.next139.1
  %160 = bitcast double* %159 to <2 x double>*
  %161 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next139.1
  %162 = bitcast double* %161 to <2 x double>*
  %163 = load <2 x double>, <2 x double>* %160, align 8
  %164 = load <2 x double>, <2 x double>* %162, align 8
  %165 = fmul <2 x double> %163, %164
  %166 = extractelement <2 x double> %165, i32 0
  %167 = extractelement <2 x double> %165, i32 1
  %168 = fsub double %158, %166
  %169 = fsub double %168, %167
  %indvars.iv.next139.3 = add nsw i64 %indvars.iv138, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next139.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit
  %.3.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %169, %._crit_edge.loopexit ]
  %170 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %132, i64 %132
  %171 = load double, double* %170, align 8
  %172 = fdiv double %.3.lcssa, %171
  %173 = getelementptr inbounds double, double* %3, i64 %132
  store double %172, double* %173, align 8
  %174 = icmp sgt i32 %.292104, 0
  br i1 %174, label %._crit_edge..preheader_crit_edge, label %176

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge.thread, %._crit_edge
  %175 = add nsw i32 %.292104, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %.preheader

; <label>:176:                                    ; preds = %._crit_edge
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
  br label %7

; <label>:7:                                      ; preds = %13, %2
  %indvars.iv = phi i64 [ %indvars.iv.next, %13 ], [ 0, %2 ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %7, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %13
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
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

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
!4 = distinct !{!4, !2}
