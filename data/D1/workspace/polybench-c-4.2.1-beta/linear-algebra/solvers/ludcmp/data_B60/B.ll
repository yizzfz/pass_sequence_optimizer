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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #0 {
  %6 = alloca i32, align 4
  %7 = alloca [2000 x double]*, align 8
  %8 = alloca [2000 x [2000 x double]]*, align 8
  store i32 %0, i32* %6, align 4
  store [2000 x double]* %1, [2000 x double]** %7, align 8
  %9 = sitofp i32 %0 to double
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph64, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %5
  br label %._crit_edge._crit_edge

.lr.ph64:                                         ; preds = %5
  %11 = sext i32 %0 to i64
  %xtraiter209 = and i64 %11, 1
  %lcmp.mod210 = icmp eq i64 %xtraiter209, 0
  br i1 %lcmp.mod210, label %._crit_edge77.prol.loopexit, label %._crit_edge77.prol.preheader

._crit_edge77.prol.preheader:                     ; preds = %.lr.ph64
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %12 = fdiv double 1.000000e+00, %9
  %13 = fmul double %12, 5.000000e-01
  %14 = fadd double %13, 4.000000e+00
  store double %14, double* %2, align 8
  br label %._crit_edge77.prol.loopexit

._crit_edge77.prol.loopexit:                      ; preds = %.lr.ph64, %._crit_edge77.prol.preheader
  %indvars.iv124.unr = phi i64 [ 0, %.lr.ph64 ], [ 1, %._crit_edge77.prol.preheader ]
  %15 = icmp eq i32 %0, 1
  br i1 %15, label %._crit_edge, label %.lr.ph64.new

.lr.ph64.new:                                     ; preds = %._crit_edge77.prol.loopexit
  br label %._crit_edge77

._crit_edge.unr-lcssa:                            ; preds = %._crit_edge77
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge77.prol.loopexit, %._crit_edge.unr-lcssa
  br i1 true, label %._crit_edge11.lr.ph, label %._crit_edge.._crit_edge._crit_edge_crit_edge

._crit_edge.._crit_edge._crit_edge_crit_edge:     ; preds = %._crit_edge
  br label %._crit_edge._crit_edge

._crit_edge11.lr.ph:                              ; preds = %._crit_edge
  %16 = add i32 %0, -1
  %wide.trip.count122 = sext i32 %16 to i64
  %17 = add nsw i64 %wide.trip.count122, -1
  br label %._crit_edge11

._crit_edge77:                                    ; preds = %._crit_edge77, %.lr.ph64.new
  %indvars.iv124 = phi i64 [ %indvars.iv124.unr, %.lr.ph64.new ], [ %indvars.iv.next125.1, %._crit_edge77 ]
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv124
  %19 = bitcast double* %18 to <2 x double>*
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv124
  %21 = bitcast double* %20 to <2 x double>*
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %22 = trunc i64 %indvars.iv.next125 to i32
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv124
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  %indvars.iv.next125.1 = add nsw i64 %indvars.iv124, 2
  %25 = trunc i64 %indvars.iv.next125.1 to i32
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %9, i32 0
  %28 = insertelement <2 x double> %27, double %9, i32 1
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %26, i32 1
  %31 = fdiv <2 x double> %30, %28
  %32 = fmul <2 x double> %31, <double 5.000000e-01, double 5.000000e-01>
  %33 = fadd <2 x double> %32, <double 4.000000e+00, double 4.000000e+00>
  %34 = bitcast double* %24 to <2 x double>*
  store <2 x double> %33, <2 x double>* %34, align 8
  %35 = icmp slt i64 %indvars.iv.next125.1, %11
  br i1 %35, label %._crit_edge77, label %._crit_edge.unr-lcssa

._crit_edge11:                                    ; preds = %._crit_edge54, %._crit_edge11.lr.ph
  %indvar205 = phi i64 [ %indvar.next, %._crit_edge54 ], [ 0, %._crit_edge11.lr.ph ]
  %36 = phi i32 [ %storemerge1051, %._crit_edge54 ], [ 0, %._crit_edge11.lr.ph ]
  %37 = sub i64 %wide.trip.count122, %indvar205
  %38 = sub i64 %17, %indvar205
  %39 = icmp slt i32 %36, 0
  br i1 %39, label %._crit_edge11.._crit_edge48_crit_edge, label %.lr.ph47

._crit_edge11.._crit_edge48_crit_edge:            ; preds = %._crit_edge11
  %.pre197 = sext i32 %36 to i64
  br label %._crit_edge48

.lr.ph47:                                         ; preds = %._crit_edge11
  %40 = sext i32 %36 to i64
  %41 = zext i32 %36 to i64
  br label %42

; <label>:42:                                     ; preds = %42, %.lr.ph47
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %42 ], [ 0, %.lr.ph47 ]
  %43 = sub nsw i64 0, %indvars.iv116
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, %0
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %9
  %48 = fadd double %47, 1.000000e+00
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %40, i64 %indvars.iv116
  store double %48, double* %49, align 8
  %exitcond137 = icmp eq i64 %indvars.iv116, %41
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  br i1 %exitcond137, label %._crit_edge48.loopexit, label %42

._crit_edge48.loopexit:                           ; preds = %42
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge11.._crit_edge48_crit_edge, %._crit_edge48.loopexit
  %.pre-phi = phi i64 [ %.pre197, %._crit_edge11.._crit_edge48_crit_edge ], [ %40, %._crit_edge48.loopexit ]
  %storemerge1051 = add nsw i32 %36, 1
  %50 = icmp slt i32 %storemerge1051, %0
  br i1 %50, label %.lr.ph53, label %._crit_edge54

.lr.ph53:                                         ; preds = %._crit_edge48
  %51 = sext i32 %storemerge1051 to i64
  %xtraiter206 = and i64 %37, 7
  %lcmp.mod207 = icmp eq i64 %xtraiter206, 0
  br i1 %lcmp.mod207, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph53
  br label %52

; <label>:52:                                     ; preds = %52, %.prol.preheader
  %indvars.iv120.prol = phi i64 [ %indvars.iv.next121.prol, %52 ], [ %51, %.prol.preheader ]
  %prol.iter208 = phi i64 [ %prol.iter208.sub, %52 ], [ %xtraiter206, %.prol.preheader ]
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv120.prol
  store double 0.000000e+00, double* %53, align 8
  %indvars.iv.next121.prol = add nsw i64 %indvars.iv120.prol, 1
  %prol.iter208.sub = add i64 %prol.iter208, -1
  %prol.iter208.cmp = icmp eq i64 %prol.iter208.sub, 0
  br i1 %prol.iter208.cmp, label %.prol.loopexit.unr-lcssa, label %52, !llvm.loop !1

.prol.loopexit.unr-lcssa:                         ; preds = %52
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph53, %.prol.loopexit.unr-lcssa
  %indvars.iv120.unr = phi i64 [ %51, %.lr.ph53 ], [ %indvars.iv.next121.prol, %.prol.loopexit.unr-lcssa ]
  %54 = icmp ult i64 %38, 7
  br i1 %54, label %._crit_edge54.loopexit, label %.lr.ph53.new

.lr.ph53.new:                                     ; preds = %.prol.loopexit
  br label %55

; <label>:55:                                     ; preds = %55, %.lr.ph53.new
  %indvars.iv120 = phi i64 [ %indvars.iv120.unr, %.lr.ph53.new ], [ %indvars.iv.next121.7, %55 ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv120
  store double 0.000000e+00, double* %56, align 8
  %indvars.iv.next121 = add nsw i64 %indvars.iv120, 1
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv.next121
  store double 0.000000e+00, double* %57, align 8
  %indvars.iv.next121.1 = add nsw i64 %indvars.iv120, 2
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv.next121.1
  store double 0.000000e+00, double* %58, align 8
  %indvars.iv.next121.2 = add nsw i64 %indvars.iv120, 3
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv.next121.2
  store double 0.000000e+00, double* %59, align 8
  %indvars.iv.next121.3 = add nsw i64 %indvars.iv120, 4
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv.next121.3
  store double 0.000000e+00, double* %60, align 8
  %indvars.iv.next121.4 = add nsw i64 %indvars.iv120, 5
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv.next121.4
  store double 0.000000e+00, double* %61, align 8
  %indvars.iv.next121.5 = add nsw i64 %indvars.iv120, 6
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv.next121.5
  store double 0.000000e+00, double* %62, align 8
  %indvars.iv.next121.6 = add nsw i64 %indvars.iv120, 7
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv.next121.6
  store double 0.000000e+00, double* %63, align 8
  %exitcond123.7 = icmp eq i64 %indvars.iv.next121.6, %wide.trip.count122
  %indvars.iv.next121.7 = add nsw i64 %indvars.iv120, 8
  br i1 %exitcond123.7, label %._crit_edge54.loopexit.unr-lcssa, label %55

._crit_edge54.loopexit.unr-lcssa:                 ; preds = %55
  br label %._crit_edge54.loopexit

._crit_edge54.loopexit:                           ; preds = %.prol.loopexit, %._crit_edge54.loopexit.unr-lcssa
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %._crit_edge48
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %.pre-phi
  store double 1.000000e+00, double* %64, align 8
  %indvar.next = add i64 %indvar205, 1
  br i1 %50, label %._crit_edge11, label %._crit_edge58

._crit_edge58:                                    ; preds = %._crit_edge54
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge.._crit_edge._crit_edge_crit_edge, %._crit_edge.thread, %._crit_edge58
  %65 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %66 = bitcast [2000 x [2000 x double]]** %8 to i8**
  store i8* %65, i8** %66, align 8
  %67 = bitcast i8* %65 to [2000 x [2000 x double]]*
  %68 = ptrtoint i8* %65 to i64
  %69 = inttoptr i64 %68 to [2000 x [2000 x double]]*
  br i1 %10, label %._crit_edge12.lr.ph, label %._crit_edge13.thread

._crit_edge13.thread:                             ; preds = %._crit_edge._crit_edge
  br label %._crit_edge15

._crit_edge12.lr.ph:                              ; preds = %._crit_edge._crit_edge
  %70 = sext i32 %0 to i64
  br i1 true, label %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge, label %._crit_edge12..._crit_edge13_crit_edge_crit_edge

._crit_edge12.lr.ph.._crit_edge12.us_crit_edge:   ; preds = %._crit_edge12.lr.ph
  %71 = add i32 %0, -1
  %72 = zext i32 %71 to i64
  %73 = shl nuw nsw i64 %72, 3
  %74 = add nuw nsw i64 %73, 8
  %75 = add nsw i64 %70, -1
  %xtraiter202 = and i64 %70, 3
  %lcmp.mod203 = icmp eq i64 %xtraiter202, 0
  br i1 %lcmp.mod203, label %._crit_edge40.us.prol.loopexit, label %._crit_edge40.us.prol.preheader

._crit_edge40.us.prol.preheader:                  ; preds = %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge
  br label %._crit_edge40.us.prol

._crit_edge40.us.prol:                            ; preds = %._crit_edge40.us.prol, %._crit_edge40.us.prol.preheader
  %indvar128.prol = phi i64 [ %indvar.next129.prol, %._crit_edge40.us.prol ], [ 0, %._crit_edge40.us.prol.preheader ]
  %indvars.iv113.prol = phi i64 [ %indvars.iv.next114.prol, %._crit_edge40.us.prol ], [ 0, %._crit_edge40.us.prol.preheader ]
  %prol.iter204 = phi i64 [ %prol.iter204.sub, %._crit_edge40.us.prol ], [ %xtraiter202, %._crit_edge40.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvar128.prol, i64 0
  %scevgep130.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep130.prol, i8 0, i64 %74, i32 8, i1 false)
  %indvars.iv.next114.prol = add nsw i64 %indvars.iv113.prol, 1
  %indvar.next129.prol = add nuw nsw i64 %indvar128.prol, 1
  %prol.iter204.sub = add i64 %prol.iter204, -1
  %prol.iter204.cmp = icmp eq i64 %prol.iter204.sub, 0
  br i1 %prol.iter204.cmp, label %._crit_edge40.us.prol.loopexit.unr-lcssa, label %._crit_edge40.us.prol, !llvm.loop !3

._crit_edge40.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge40.us.prol
  br label %._crit_edge40.us.prol.loopexit

._crit_edge40.us.prol.loopexit:                   ; preds = %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge, %._crit_edge40.us.prol.loopexit.unr-lcssa
  %indvar128.unr = phi i64 [ 0, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge ], [ %indvar.next129.prol, %._crit_edge40.us.prol.loopexit.unr-lcssa ]
  %indvars.iv113.unr = phi i64 [ 0, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge ], [ %indvars.iv.next114.prol, %._crit_edge40.us.prol.loopexit.unr-lcssa ]
  %76 = icmp ult i64 %75, 3
  br i1 %76, label %._crit_edge40.us..._crit_edge13_crit_edge_crit_edge, label %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new

._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new: ; preds = %._crit_edge40.us.prol.loopexit
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new
  %indvar128 = phi i64 [ %indvar128.unr, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new ], [ %indvar.next129.3, %._crit_edge40.us ]
  %indvars.iv113 = phi i64 [ %indvars.iv113.unr, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new ], [ %indvars.iv.next114.3, %._crit_edge40.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvar128, i64 0
  %scevgep130 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep130, i8 0, i64 %74, i32 8, i1 false)
  %indvar.next129 = add nuw nsw i64 %indvar128, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvar.next129, i64 0
  %scevgep130.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep130.1, i8 0, i64 %74, i32 8, i1 false)
  %indvar.next129.1 = add nsw i64 %indvar128, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvar.next129.1, i64 0
  %scevgep130.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep130.2, i8 0, i64 %74, i32 8, i1 false)
  %indvar.next129.2 = add nsw i64 %indvar128, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvar.next129.2, i64 0
  %scevgep130.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep130.3, i8 0, i64 %74, i32 8, i1 false)
  %indvars.iv.next114.3 = add nsw i64 %indvars.iv113, 4
  %77 = icmp slt i64 %indvars.iv.next114.3, %70
  %indvar.next129.3 = add nsw i64 %indvar128, 4
  br i1 %77, label %._crit_edge40.us, label %._crit_edge40.us..._crit_edge13_crit_edge_crit_edge.unr-lcssa

._crit_edge40.us..._crit_edge13_crit_edge_crit_edge.unr-lcssa: ; preds = %._crit_edge40.us
  br label %._crit_edge40.us..._crit_edge13_crit_edge_crit_edge

._crit_edge40.us..._crit_edge13_crit_edge_crit_edge: ; preds = %._crit_edge40.us.prol.loopexit, %._crit_edge40.us..._crit_edge13_crit_edge_crit_edge.unr-lcssa
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge40.us..._crit_edge13_crit_edge_crit_edge, %._crit_edge12..._crit_edge13_crit_edge_crit_edge
  br i1 true, label %._crit_edge14.lr.ph, label %._crit_edge15.thread

._crit_edge15.thread:                             ; preds = %._crit_edge13
  br label %._crit_edge15._crit_edge

._crit_edge14.lr.ph:                              ; preds = %._crit_edge13
  %78 = bitcast [2000 x [2000 x double]]* %69 to i8*
  br i1 true, label %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge, label %._crit_edge14..._crit_edge15_crit_edge_crit_edge

._crit_edge14.lr.ph.._crit_edge14.us_crit_edge:   ; preds = %._crit_edge14.lr.ph
  %79 = add i32 %0, -1
  %80 = zext i32 %79 to i64
  %81 = add nuw nsw i64 %80, 1
  %min.iters.check = icmp ult i64 %81, 4
  %n.vec = and i64 %81, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %81, %n.vec
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge29.us, %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge
  %indvar = phi i64 [ %82, %._crit_edge29.us ], [ 0, %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge ]
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge29.us ], [ 0, %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge ]
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvar
  %82 = add i64 %indvar, 1
  %scevgep151 = getelementptr [2000 x double], [2000 x double]* %1, i64 %80, i64 %82
  br i1 true, label %._crit_edge16.us.us.preheader, label %._crit_edge14.us.._crit_edge29.us_crit_edge

._crit_edge14.us.._crit_edge29.us_crit_edge:      ; preds = %._crit_edge14.us
  br label %._crit_edge29.us

._crit_edge16.us.us.preheader:                    ; preds = %._crit_edge14.us
  br label %._crit_edge16.us.us

._crit_edge29.us:                                 ; preds = %._crit_edge14.us.._crit_edge29.us_crit_edge, %._crit_edge27.us.us.._crit_edge29.us_crit_edge
  %indvars.iv.next107 = add i64 %indvars.iv106, 1
  %83 = icmp slt i64 %indvars.iv.next107, %70
  br i1 %83, label %._crit_edge14.us, label %._crit_edge29.us..._crit_edge15_crit_edge_crit_edge

._crit_edge29.us..._crit_edge15_crit_edge_crit_edge: ; preds = %._crit_edge29.us
  br label %.._crit_edge15_crit_edge

._crit_edge16.us.us:                              ; preds = %._crit_edge16.us.us.preheader, %._crit_edge27.us.us
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %._crit_edge27.us.us ], [ 0, %._crit_edge16.us.us.preheader ]
  %scevgep145 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv104, i64 0
  %scevgep147 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv104, i64 %81
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv106
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge16.us.us
  %indvars.iv100.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge16.us.us ], [ %n.vec, %middle.block ]
  %85 = sub nsw i64 %81, %indvars.iv100.ph
  %xtraiter200 = and i64 %85, 1
  %lcmp.mod201 = icmp eq i64 %xtraiter200, 0
  br i1 %lcmp.mod201, label %scalar.ph.prol.loopexit.unr-lcssa, label %scalar.ph.prol.preheader

scalar.ph.prol.preheader:                         ; preds = %scalar.ph.preheader
  %86 = load double, double* %84, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100.ph, i64 %indvars.iv106
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv104, i64 %indvars.iv100.ph
  %91 = load double, double* %90, align 8
  %92 = fadd double %91, %89
  store double %92, double* %90, align 8
  %indvars.iv.next101.prol = or i64 %indvars.iv100.ph, 1
  br label %scalar.ph.prol.loopexit.unr-lcssa

scalar.ph.prol.loopexit.unr-lcssa:                ; preds = %scalar.ph.preheader, %scalar.ph.prol.preheader
  %indvars.iv100.unr.ph = phi i64 [ %indvars.iv.next101.prol, %scalar.ph.prol.preheader ], [ %indvars.iv100.ph, %scalar.ph.preheader ]
  %93 = icmp eq i64 %80, %indvars.iv100.ph
  br i1 %93, label %._crit_edge27.us.us.loopexit, label %scalar.ph.preheader.new

scalar.ph.preheader.new:                          ; preds = %scalar.ph.prol.loopexit.unr-lcssa
  br label %scalar.ph

min.iters.checked:                                ; preds = %._crit_edge16.us.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep145, %scevgep151
  %bound1 = icmp ult double* %scevgep149, %scevgep147
  %found.conflict = and i1 %bound0, %bound1
  %bound0154 = icmp ult double* %scevgep145, %84
  %bound1155 = icmp ult double* %84, %scevgep147
  %found.conflict156 = and i1 %bound0154, %bound1155
  %conflict.rdx = or i1 %found.conflict, %found.conflict156
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %94 = or i64 %index, 1
  %95 = or i64 %index, 2
  %96 = or i64 %index, 3
  %97 = load double, double* %84, align 8, !alias.scope !4
  %98 = insertelement <2 x double> undef, double %97, i32 0
  %99 = shufflevector <2 x double> %98, <2 x double> undef, <2 x i32> zeroinitializer
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv106
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %94, i64 %indvars.iv106
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %95, i64 %indvars.iv106
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %96, i64 %indvars.iv106
  %104 = load double, double* %100, align 8, !alias.scope !7
  %105 = load double, double* %101, align 8, !alias.scope !7
  %106 = load double, double* %102, align 8, !alias.scope !7
  %107 = load double, double* %103, align 8, !alias.scope !7
  %108 = insertelement <2 x double> undef, double %104, i32 0
  %109 = insertelement <2 x double> %108, double %105, i32 1
  %110 = insertelement <2 x double> undef, double %106, i32 0
  %111 = insertelement <2 x double> %110, double %107, i32 1
  %112 = fmul <2 x double> %99, %109
  %113 = fmul <2 x double> %99, %111
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv104, i64 %index
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !9, !noalias !11
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !9, !noalias !11
  %118 = fadd <2 x double> %wide.load, %112
  %119 = fadd <2 x double> %wide.load158, %113
  store <2 x double> %118, <2 x double>* %115, align 8, !alias.scope !9, !noalias !11
  store <2 x double> %119, <2 x double>* %117, align 8, !alias.scope !9, !noalias !11
  %index.next = add i64 %index, 4
  %120 = icmp eq i64 %index.next, %n.vec
  br i1 %120, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge27.us.us, label %scalar.ph.preheader

._crit_edge27.us.us.loopexit.unr-lcssa:           ; preds = %scalar.ph
  br label %._crit_edge27.us.us.loopexit

._crit_edge27.us.us.loopexit:                     ; preds = %scalar.ph.prol.loopexit.unr-lcssa, %._crit_edge27.us.us.loopexit.unr-lcssa
  br label %._crit_edge27.us.us

._crit_edge27.us.us:                              ; preds = %._crit_edge27.us.us.loopexit, %middle.block
  %indvars.iv.next105 = add nuw i64 %indvars.iv104, 1
  %121 = icmp slt i64 %indvars.iv.next105, %70
  br i1 %121, label %._crit_edge16.us.us, label %._crit_edge27.us.us.._crit_edge29.us_crit_edge

._crit_edge27.us.us.._crit_edge29.us_crit_edge:   ; preds = %._crit_edge27.us.us
  br label %._crit_edge29.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader.new
  %indvars.iv100 = phi i64 [ %indvars.iv100.unr.ph, %scalar.ph.preheader.new ], [ %indvars.iv.next101.1, %scalar.ph ]
  %122 = load double, double* %84, align 8
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100, i64 %indvars.iv106
  %124 = load double, double* %123, align 8
  %125 = fmul double %122, %124
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv104, i64 %indvars.iv100
  %127 = load double, double* %126, align 8
  %128 = fadd double %127, %125
  store double %128, double* %126, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %129 = load double, double* %84, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next101, i64 %indvars.iv106
  %131 = load double, double* %130, align 8
  %132 = fmul double %129, %131
  %133 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next101
  %134 = load double, double* %133, align 8
  %135 = fadd double %134, %132
  store double %135, double* %133, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next101, %80
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  br i1 %exitcond.1, label %._crit_edge27.us.us.loopexit.unr-lcssa, label %scalar.ph, !llvm.loop !15

._crit_edge12..._crit_edge13_crit_edge_crit_edge: ; preds = %._crit_edge12.lr.ph
  br label %._crit_edge13

.._crit_edge15_crit_edge:                         ; preds = %._crit_edge14..._crit_edge15_crit_edge_crit_edge, %._crit_edge29.us..._crit_edge15_crit_edge_crit_edge
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge13.thread, %.._crit_edge15_crit_edge
  %136 = phi i8* [ %65, %._crit_edge13.thread ], [ %78, %.._crit_edge15_crit_edge ]
  %137 = phi [2000 x [2000 x double]]* [ %67, %._crit_edge13.thread ], [ %69, %.._crit_edge15_crit_edge ]
  br i1 %10, label %._crit_edge17.lr.ph, label %._crit_edge15._crit_edge

._crit_edge17.lr.ph:                              ; preds = %._crit_edge15
  %138 = sext i32 %0 to i64
  br i1 true, label %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge, label %._crit_edge17.._crit_edge21_crit_edge

._crit_edge17.lr.ph.._crit_edge17.us_crit_edge:   ; preds = %._crit_edge17.lr.ph
  %139 = add i32 %0, -1
  %140 = zext i32 %139 to i64
  %141 = add nuw nsw i64 %140, 1
  %142 = and i64 %141, 8589934588
  %143 = add nsw i64 %142, -4
  %144 = lshr exact i64 %143, 2
  %min.iters.check162 = icmp ult i64 %141, 4
  %cmp.zero166 = icmp eq i64 %142, 0
  %145 = and i64 %144, 1
  %lcmp.mod = icmp eq i64 %145, 0
  %146 = icmp eq i64 %144, 0
  %cmp.n187 = icmp eq i64 %141, %142
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge19.us, %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge
  %indvar168 = phi i64 [ %indvar.next169, %._crit_edge19.us ], [ 0, %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge ]
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge19.us ], [ 0, %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge ]
  %scevgep170 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvar168, i64 0
  %scevgep172 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvar168, i64 %141
  %scevgep174 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %137, i64 0, i64 %indvar168, i64 0
  %scevgep176 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %137, i64 0, i64 %indvar168, i64 %141
  br i1 %min.iters.check162, label %scalar.ph161.preheader, label %min.iters.checked163

min.iters.checked163:                             ; preds = %._crit_edge17.us
  br i1 %cmp.zero166, label %scalar.ph161.preheader, label %vector.memcheck182

vector.memcheck182:                               ; preds = %min.iters.checked163
  %bound0178 = icmp ult double* %scevgep170, %scevgep176
  %bound1179 = icmp ult double* %scevgep174, %scevgep172
  %memcheck.conflict181 = and i1 %bound0178, %bound1179
  br i1 %memcheck.conflict181, label %scalar.ph161.preheader, label %vector.body159.preheader

vector.body159.preheader:                         ; preds = %vector.memcheck182
  br i1 %lcmp.mod, label %vector.body159.prol.preheader, label %vector.body159.prol.loopexit.unr-lcssa

vector.body159.prol.preheader:                    ; preds = %vector.body159.preheader
  %147 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %137, i64 0, i64 %indvars.iv97, i64 0
  %148 = bitcast double* %147 to <2 x i64>*
  %wide.load192.prol = load <2 x i64>, <2 x i64>* %148, align 8, !alias.scope !16
  %149 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %137, i64 0, i64 %indvars.iv97, i64 2
  %150 = bitcast double* %149 to <2 x i64>*
  %wide.load193.prol = load <2 x i64>, <2 x i64>* %150, align 8, !alias.scope !16
  %151 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 0
  %152 = bitcast double* %151 to <2 x i64>*
  store <2 x i64> %wide.load192.prol, <2 x i64>* %152, align 8, !alias.scope !19, !noalias !16
  %153 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 2
  %154 = bitcast double* %153 to <2 x i64>*
  store <2 x i64> %wide.load193.prol, <2 x i64>* %154, align 8, !alias.scope !19, !noalias !16
  br label %vector.body159.prol.loopexit.unr-lcssa

vector.body159.prol.loopexit.unr-lcssa:           ; preds = %vector.body159.preheader, %vector.body159.prol.preheader
  %index184.unr.ph = phi i64 [ 4, %vector.body159.prol.preheader ], [ 0, %vector.body159.preheader ]
  br i1 %146, label %middle.block160, label %vector.body159.preheader.new

vector.body159.preheader.new:                     ; preds = %vector.body159.prol.loopexit.unr-lcssa
  br label %vector.body159

vector.body159:                                   ; preds = %vector.body159, %vector.body159.preheader.new
  %index184 = phi i64 [ %index184.unr.ph, %vector.body159.preheader.new ], [ %index.next185.1, %vector.body159 ]
  %155 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %137, i64 0, i64 %indvars.iv97, i64 %index184
  %156 = bitcast double* %155 to <2 x i64>*
  %wide.load192 = load <2 x i64>, <2 x i64>* %156, align 8, !alias.scope !16
  %157 = getelementptr double, double* %155, i64 2
  %158 = bitcast double* %157 to <2 x i64>*
  %wide.load193 = load <2 x i64>, <2 x i64>* %158, align 8, !alias.scope !16
  %159 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %index184
  %160 = bitcast double* %159 to <2 x i64>*
  store <2 x i64> %wide.load192, <2 x i64>* %160, align 8, !alias.scope !19, !noalias !16
  %161 = getelementptr double, double* %159, i64 2
  %162 = bitcast double* %161 to <2 x i64>*
  store <2 x i64> %wide.load193, <2 x i64>* %162, align 8, !alias.scope !19, !noalias !16
  %index.next185 = add i64 %index184, 4
  %163 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %137, i64 0, i64 %indvars.iv97, i64 %index.next185
  %164 = bitcast double* %163 to <2 x i64>*
  %wide.load192.1 = load <2 x i64>, <2 x i64>* %164, align 8, !alias.scope !16
  %165 = getelementptr double, double* %163, i64 2
  %166 = bitcast double* %165 to <2 x i64>*
  %wide.load193.1 = load <2 x i64>, <2 x i64>* %166, align 8, !alias.scope !16
  %167 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %index.next185
  %168 = bitcast double* %167 to <2 x i64>*
  store <2 x i64> %wide.load192.1, <2 x i64>* %168, align 8, !alias.scope !19, !noalias !16
  %169 = getelementptr double, double* %167, i64 2
  %170 = bitcast double* %169 to <2 x i64>*
  store <2 x i64> %wide.load193.1, <2 x i64>* %170, align 8, !alias.scope !19, !noalias !16
  %index.next185.1 = add i64 %index184, 8
  %171 = icmp eq i64 %index.next185.1, %142
  br i1 %171, label %middle.block160.unr-lcssa, label %vector.body159, !llvm.loop !21

middle.block160.unr-lcssa:                        ; preds = %vector.body159
  br label %middle.block160

middle.block160:                                  ; preds = %vector.body159.prol.loopexit.unr-lcssa, %middle.block160.unr-lcssa
  br i1 %cmp.n187, label %._crit_edge19.us, label %scalar.ph161.preheader

scalar.ph161.preheader:                           ; preds = %middle.block160, %vector.memcheck182, %min.iters.checked163, %._crit_edge17.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck182 ], [ 0, %min.iters.checked163 ], [ 0, %._crit_edge17.us ], [ %142, %middle.block160 ]
  %172 = sub nsw i64 %141, %indvars.iv.ph
  %173 = sub nsw i64 %140, %indvars.iv.ph
  %xtraiter198 = and i64 %172, 3
  %lcmp.mod199 = icmp eq i64 %xtraiter198, 0
  br i1 %lcmp.mod199, label %scalar.ph161.prol.loopexit, label %scalar.ph161.prol.preheader

scalar.ph161.prol.preheader:                      ; preds = %scalar.ph161.preheader
  br label %scalar.ph161.prol

scalar.ph161.prol:                                ; preds = %scalar.ph161.prol, %scalar.ph161.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph161.prol ], [ %indvars.iv.ph, %scalar.ph161.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph161.prol ], [ %xtraiter198, %scalar.ph161.prol.preheader ]
  %174 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %137, i64 0, i64 %indvars.iv97, i64 %indvars.iv.prol
  %175 = bitcast double* %174 to i64*
  %176 = load i64, i64* %175, align 8
  %177 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv.prol
  %178 = bitcast double* %177 to i64*
  store i64 %176, i64* %178, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph161.prol.loopexit.unr-lcssa, label %scalar.ph161.prol, !llvm.loop !22

scalar.ph161.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph161.prol
  br label %scalar.ph161.prol.loopexit

scalar.ph161.prol.loopexit:                       ; preds = %scalar.ph161.preheader, %scalar.ph161.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph161.preheader ], [ %indvars.iv.next.prol, %scalar.ph161.prol.loopexit.unr-lcssa ]
  %179 = icmp ult i64 %173, 3
  br i1 %179, label %._crit_edge19.us.loopexit, label %scalar.ph161.preheader.new

scalar.ph161.preheader.new:                       ; preds = %scalar.ph161.prol.loopexit
  br label %scalar.ph161

scalar.ph161:                                     ; preds = %scalar.ph161, %scalar.ph161.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %scalar.ph161.preheader.new ], [ %indvars.iv.next.3, %scalar.ph161 ]
  %180 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %137, i64 0, i64 %indvars.iv97, i64 %indvars.iv
  %181 = bitcast double* %180 to i64*
  %182 = load i64, i64* %181, align 8
  %183 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv
  %184 = bitcast double* %183 to i64*
  store i64 %182, i64* %184, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %185 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %137, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next
  %186 = bitcast double* %185 to i64*
  %187 = load i64, i64* %186, align 8
  %188 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv.next
  %189 = bitcast double* %188 to i64*
  store i64 %187, i64* %189, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %190 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %137, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.1
  %191 = bitcast double* %190 to i64*
  %192 = load i64, i64* %191, align 8
  %193 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv.next.1
  %194 = bitcast double* %193 to i64*
  store i64 %192, i64* %194, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %195 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %137, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.2
  %196 = bitcast double* %195 to i64*
  %197 = load i64, i64* %196, align 8
  %198 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv.next.2
  %199 = bitcast double* %198 to i64*
  store i64 %197, i64* %199, align 8
  %exitcond135.3 = icmp eq i64 %indvars.iv.next.2, %140
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond135.3, label %._crit_edge19.us.loopexit.unr-lcssa, label %scalar.ph161, !llvm.loop !23

._crit_edge19.us.loopexit.unr-lcssa:              ; preds = %scalar.ph161
  br label %._crit_edge19.us.loopexit

._crit_edge19.us.loopexit:                        ; preds = %scalar.ph161.prol.loopexit, %._crit_edge19.us.loopexit.unr-lcssa
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit, %middle.block160
  %indvars.iv.next98 = add i64 %indvars.iv97, 1
  %200 = icmp slt i64 %indvars.iv.next98, %138
  %indvar.next169 = add i64 %indvar168, 1
  br i1 %200, label %._crit_edge17.us, label %._crit_edge19.us.._crit_edge21_crit_edge

._crit_edge19.us.._crit_edge21_crit_edge:         ; preds = %._crit_edge19.us
  br label %._crit_edge21

._crit_edge14..._crit_edge15_crit_edge_crit_edge: ; preds = %._crit_edge14.lr.ph
  br label %.._crit_edge15_crit_edge

._crit_edge17.._crit_edge21_crit_edge:            ; preds = %._crit_edge17.lr.ph
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge17.._crit_edge21_crit_edge, %._crit_edge19.us.._crit_edge21_crit_edge
  br label %._crit_edge15._crit_edge

._crit_edge15._crit_edge:                         ; preds = %._crit_edge15, %._crit_edge15.thread, %._crit_edge21
  %201 = phi i8* [ %136, %._crit_edge15 ], [ undef, %._crit_edge15.thread ], [ %136, %._crit_edge21 ]
  call void @free(i8* %201) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %._crit_edge.lr.ph, label %._crit_edge9

._crit_edge.lr.ph:                                ; preds = %5
  %7 = add i32 %0, -1
  %8 = sext i32 %0 to i64
  %wide.trip.count112 = sext i32 %7 to i64
  %9 = add nsw i64 %wide.trip.count112, 1
  br label %._crit_edge

.._crit_edge9_crit_edge:                          ; preds = %._crit_edge55
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %5, %.._crit_edge9_crit_edge
  br i1 %6, label %.lr.ph29, label %._crit_edge9._crit_edge.thread

._crit_edge9._crit_edge.thread:                   ; preds = %._crit_edge9
  br label %._crit_edge76

.lr.ph29:                                         ; preds = %._crit_edge9
  %10 = sext i32 %0 to i64
  br label %84

._crit_edge:                                      ; preds = %._crit_edge55, %._crit_edge.lr.ph
  %indvars.iv133 = phi i32 [ %16, %._crit_edge55 ], [ -1, %._crit_edge.lr.ph ]
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %._crit_edge55 ], [ 0, %._crit_edge.lr.ph ]
  %11 = add i64 %indvars.iv124, 4294967295
  %12 = and i64 %11, 4294967295
  %13 = sub i64 %9, %indvars.iv124
  %14 = sub i64 %wide.trip.count112, %indvars.iv124
  %15 = zext i32 %indvars.iv133 to i64
  %16 = add i32 %indvars.iv133, 1
  %17 = icmp sgt i64 %indvars.iv124, 0
  br i1 %17, label %.lr.ph41.preheader, label %._crit_edge42

.lr.ph41.preheader:                               ; preds = %._crit_edge
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv124, i64 0
  br label %.lr.ph41

.lr.ph41:                                         ; preds = %.lr.ph41.preheader, %._crit_edge69
  %indvars.iv130 = phi i32 [ %22, %._crit_edge69 ], [ -1, %.lr.ph41.preheader ]
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge69 ], [ 0, %.lr.ph41.preheader ]
  %19 = add i64 %indvars.iv106, 4294967295
  %20 = and i64 %19, 4294967295
  %21 = zext i32 %indvars.iv130 to i64
  %22 = add i32 %indvars.iv130, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv124, i64 %indvars.iv106
  %24 = load double, double* %23, align 8
  %25 = icmp sgt i64 %indvars.iv106, 0
  br i1 %25, label %.lr.ph36, label %._crit_edge69

.lr.ph36:                                         ; preds = %.lr.ph41
  %26 = and i64 %19, 1
  %lcmp.mod172 = icmp eq i64 %26, 0
  br i1 %lcmp.mod172, label %.prol.preheader169, label %.prol.loopexit170.unr-lcssa

.prol.preheader169:                               ; preds = %.lr.ph36
  %27 = load double, double* %18, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv106
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %24, %30
  br label %.prol.loopexit170.unr-lcssa

.prol.loopexit170.unr-lcssa:                      ; preds = %.lr.ph36, %.prol.preheader169
  %.lcssa160.unr.ph = phi double [ %31, %.prol.preheader169 ], [ undef, %.lr.ph36 ]
  %indvars.iv100.unr.ph = phi i64 [ 1, %.prol.preheader169 ], [ 0, %.lr.ph36 ]
  %.unr173.ph = phi double [ %31, %.prol.preheader169 ], [ %24, %.lr.ph36 ]
  %32 = icmp eq i64 %20, 0
  br i1 %32, label %._crit_edge37, label %.lr.ph36.new

.lr.ph36.new:                                     ; preds = %.prol.loopexit170.unr-lcssa
  br label %33

; <label>:33:                                     ; preds = %33, %.lr.ph36.new
  %indvars.iv100 = phi i64 [ %indvars.iv100.unr.ph, %.lr.ph36.new ], [ %indvars.iv.next101.1, %33 ]
  %34 = phi double [ %.unr173.ph, %.lr.ph36.new ], [ %48, %33 ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv124, i64 %indvars.iv100
  %36 = bitcast double* %35 to <2 x double>*
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100, i64 %indvars.iv106
  %38 = load double, double* %37, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %39 = load <2 x double>, <2 x double>* %36, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next101, i64 %indvars.iv106
  %41 = load double, double* %40, align 8
  %42 = insertelement <2 x double> undef, double %38, i32 0
  %43 = insertelement <2 x double> %42, double %41, i32 1
  %44 = fmul <2 x double> %39, %43
  %45 = extractelement <2 x double> %44, i32 0
  %46 = extractelement <2 x double> %44, i32 1
  %47 = fsub double %34, %45
  %48 = fsub double %47, %46
  %exitcond132.1 = icmp eq i64 %indvars.iv.next101, %21
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  br i1 %exitcond132.1, label %._crit_edge37.unr-lcssa, label %33

._crit_edge37.unr-lcssa:                          ; preds = %33
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %.prol.loopexit170.unr-lcssa, %._crit_edge37.unr-lcssa
  %.lcssa160 = phi double [ %.lcssa160.unr.ph, %.prol.loopexit170.unr-lcssa ], [ %48, %._crit_edge37.unr-lcssa ]
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %.lr.ph41, %._crit_edge37
  %49 = phi double [ %.lcssa160, %._crit_edge37 ], [ %24, %.lr.ph41 ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv106
  %51 = load double, double* %50, align 8
  %52 = fdiv double %49, %51
  store double %52, double* %23, align 8
  %indvars.iv.next107 = add nuw i64 %indvars.iv106, 1
  %53 = icmp slt i64 %indvars.iv.next107, %indvars.iv124
  br i1 %53, label %.lr.ph41, label %._crit_edge42.loopexit

._crit_edge42.loopexit:                           ; preds = %._crit_edge69
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %._crit_edge
  %54 = icmp slt i64 %indvars.iv124, %8
  br i1 %54, label %.lr.ph54, label %._crit_edge55

.lr.ph54:                                         ; preds = %._crit_edge42
  br i1 %17, label %.lr.ph54.split.us.preheader, label %.lr.ph54.split.preheader

.lr.ph54.split.preheader:                         ; preds = %.lr.ph54
  %xtraiter174 = and i64 %13, 3
  %lcmp.mod175 = icmp eq i64 %xtraiter174, 0
  br i1 %lcmp.mod175, label %.lr.ph54.split.prol.loopexit, label %.lr.ph54.split.prol.preheader

.lr.ph54.split.prol.preheader:                    ; preds = %.lr.ph54.split.preheader
  br label %.lr.ph54.split.prol

.lr.ph54.split.prol:                              ; preds = %.lr.ph54.split.prol, %.lr.ph54.split.prol.preheader
  %indvars.iv110.prol = phi i64 [ %indvars.iv.next111.prol, %.lr.ph54.split.prol ], [ %indvars.iv124, %.lr.ph54.split.prol.preheader ]
  %prol.iter176 = phi i64 [ %prol.iter176.sub, %.lr.ph54.split.prol ], [ %xtraiter174, %.lr.ph54.split.prol.preheader ]
  %indvars.iv.next111.prol = add i64 %indvars.iv110.prol, 1
  %prol.iter176.sub = add i64 %prol.iter176, -1
  %prol.iter176.cmp = icmp eq i64 %prol.iter176.sub, 0
  br i1 %prol.iter176.cmp, label %.lr.ph54.split.prol.loopexit.unr-lcssa, label %.lr.ph54.split.prol, !llvm.loop !24

.lr.ph54.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph54.split.prol
  br label %.lr.ph54.split.prol.loopexit

.lr.ph54.split.prol.loopexit:                     ; preds = %.lr.ph54.split.preheader, %.lr.ph54.split.prol.loopexit.unr-lcssa
  %indvars.iv110.unr = phi i64 [ %indvars.iv124, %.lr.ph54.split.preheader ], [ %indvars.iv.next111.prol, %.lr.ph54.split.prol.loopexit.unr-lcssa ]
  %55 = icmp ult i64 %14, 3
  br i1 %55, label %._crit_edge55.loopexit137, label %.lr.ph54.split.preheader.new

.lr.ph54.split.preheader.new:                     ; preds = %.lr.ph54.split.prol.loopexit
  br label %.lr.ph54.split

.lr.ph54.split.us.preheader:                      ; preds = %.lr.ph54
  %56 = and i64 %11, 1
  %lcmp.mod180 = icmp eq i64 %56, 0
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv124, i64 0
  %58 = icmp eq i64 %12, 0
  br label %.lr.ph54.split.us

.lr.ph54.split.us:                                ; preds = %.lr.ph54.split.us.preheader, %._crit_edge48.us
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %._crit_edge48.us ], [ %indvars.iv124, %.lr.ph54.split.us.preheader ]
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv124, i64 %indvars.iv122
  %60 = load double, double* %59, align 8
  br i1 %lcmp.mod180, label %.prol.preheader177, label %.prol.loopexit178.unr-lcssa

.prol.preheader177:                               ; preds = %.lr.ph54.split.us
  %61 = load double, double* %57, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv122
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fsub double %60, %64
  br label %.prol.loopexit178.unr-lcssa

.prol.loopexit178.unr-lcssa:                      ; preds = %.lr.ph54.split.us, %.prol.preheader177
  %.lcssa162.unr.ph = phi double [ %65, %.prol.preheader177 ], [ undef, %.lr.ph54.split.us ]
  %indvars.iv114.unr.ph = phi i64 [ 1, %.prol.preheader177 ], [ 0, %.lr.ph54.split.us ]
  %.unr181.ph = phi double [ %65, %.prol.preheader177 ], [ %60, %.lr.ph54.split.us ]
  br i1 %58, label %._crit_edge48.us, label %.lr.ph54.split.us.new

.lr.ph54.split.us.new:                            ; preds = %.prol.loopexit178.unr-lcssa
  br label %66

; <label>:66:                                     ; preds = %66, %.lr.ph54.split.us.new
  %indvars.iv114 = phi i64 [ %indvars.iv114.unr.ph, %.lr.ph54.split.us.new ], [ %indvars.iv.next115.1, %66 ]
  %67 = phi double [ %.unr181.ph, %.lr.ph54.split.us.new ], [ %81, %66 ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv124, i64 %indvars.iv114
  %69 = bitcast double* %68 to <2 x double>*
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv122
  %71 = load double, double* %70, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %72 = load <2 x double>, <2 x double>* %69, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next115, i64 %indvars.iv122
  %74 = load double, double* %73, align 8
  %75 = insertelement <2 x double> undef, double %71, i32 0
  %76 = insertelement <2 x double> %75, double %74, i32 1
  %77 = fmul <2 x double> %72, %76
  %78 = extractelement <2 x double> %77, i32 0
  %79 = extractelement <2 x double> %77, i32 1
  %80 = fsub double %67, %78
  %81 = fsub double %80, %79
  %exitcond135.1 = icmp eq i64 %indvars.iv.next115, %15
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114, 2
  br i1 %exitcond135.1, label %._crit_edge48.us.unr-lcssa, label %66

._crit_edge48.us.unr-lcssa:                       ; preds = %66
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %.prol.loopexit178.unr-lcssa, %._crit_edge48.us.unr-lcssa
  %.lcssa162 = phi double [ %.lcssa162.unr.ph, %.prol.loopexit178.unr-lcssa ], [ %81, %._crit_edge48.us.unr-lcssa ]
  store double %.lcssa162, double* %59, align 8
  %indvars.iv.next123 = add i64 %indvars.iv122, 1
  %82 = icmp slt i64 %indvars.iv.next123, %8
  br i1 %82, label %.lr.ph54.split.us, label %._crit_edge55.loopexit

.lr.ph54.split:                                   ; preds = %.lr.ph54.split, %.lr.ph54.split.preheader.new
  %indvars.iv110 = phi i64 [ %indvars.iv110.unr, %.lr.ph54.split.preheader.new ], [ %indvars.iv.next111.3, %.lr.ph54.split ]
  %indvars.iv.next111.2 = add i64 %indvars.iv110, 3
  %exitcond113.3 = icmp eq i64 %indvars.iv.next111.2, %wide.trip.count112
  %indvars.iv.next111.3 = add i64 %indvars.iv110, 4
  br i1 %exitcond113.3, label %._crit_edge55.loopexit137.unr-lcssa, label %.lr.ph54.split

._crit_edge55.loopexit137.unr-lcssa:              ; preds = %.lr.ph54.split
  br label %._crit_edge55.loopexit137

._crit_edge55.loopexit137:                        ; preds = %.lr.ph54.split.prol.loopexit, %._crit_edge55.loopexit137.unr-lcssa
  br label %._crit_edge55

._crit_edge55.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %._crit_edge55.loopexit137, %._crit_edge42
  %indvars.iv.next125 = add i64 %indvars.iv124, 1
  %83 = icmp slt i64 %indvars.iv.next125, %8
  br i1 %83, label %._crit_edge, label %.._crit_edge9_crit_edge

; <label>:84:                                     ; preds = %._crit_edge73, %.lr.ph29
  %indvars.iv127 = phi i32 [ %indvars.iv.next128, %._crit_edge73 ], [ -1, %.lr.ph29 ]
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %._crit_edge73 ], [ 0, %.lr.ph29 ]
  %85 = add i64 %indvars.iv98, 4294967295
  %86 = and i64 %85, 4294967295
  %87 = zext i32 %indvars.iv127 to i64
  %88 = getelementptr inbounds double, double* %2, i64 %indvars.iv98
  %89 = bitcast double* %88 to i64*
  %90 = load i64, i64* %89, align 8
  %91 = icmp sgt i64 %indvars.iv98, 0
  %92 = bitcast i64 %90 to double
  br i1 %91, label %.lr.ph24, label %._crit_edge73

.lr.ph24:                                         ; preds = %84
  %xtraiter165 = and i64 %indvars.iv98, 3
  %lcmp.mod166 = icmp eq i64 %xtraiter165, 0
  br i1 %lcmp.mod166, label %.prol.loopexit164, label %.prol.preheader163

.prol.preheader163:                               ; preds = %.lr.ph24
  br label %93

; <label>:93:                                     ; preds = %93, %.prol.preheader163
  %indvars.iv92.prol = phi i64 [ %indvars.iv.next93.prol, %93 ], [ 0, %.prol.preheader163 ]
  %94 = phi double [ %100, %93 ], [ %92, %.prol.preheader163 ]
  %prol.iter167 = phi i64 [ %prol.iter167.sub, %93 ], [ %xtraiter165, %.prol.preheader163 ]
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv92.prol
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds double, double* %4, i64 %indvars.iv92.prol
  %98 = load double, double* %97, align 8
  %99 = fmul double %96, %98
  %100 = fsub double %94, %99
  %indvars.iv.next93.prol = add nuw nsw i64 %indvars.iv92.prol, 1
  %prol.iter167.sub = add i64 %prol.iter167, -1
  %prol.iter167.cmp = icmp eq i64 %prol.iter167.sub, 0
  br i1 %prol.iter167.cmp, label %.prol.loopexit164.unr-lcssa, label %93, !llvm.loop !25

.prol.loopexit164.unr-lcssa:                      ; preds = %93
  br label %.prol.loopexit164

.prol.loopexit164:                                ; preds = %.lr.ph24, %.prol.loopexit164.unr-lcssa
  %.lcssa158.unr = phi double [ undef, %.lr.ph24 ], [ %100, %.prol.loopexit164.unr-lcssa ]
  %indvars.iv92.unr = phi i64 [ 0, %.lr.ph24 ], [ %indvars.iv.next93.prol, %.prol.loopexit164.unr-lcssa ]
  %.unr168 = phi double [ %92, %.lr.ph24 ], [ %100, %.prol.loopexit164.unr-lcssa ]
  %101 = icmp ult i64 %86, 3
  br i1 %101, label %._crit_edge25, label %.lr.ph24.new

.lr.ph24.new:                                     ; preds = %.prol.loopexit164
  br label %102

; <label>:102:                                    ; preds = %102, %.lr.ph24.new
  %indvars.iv92 = phi i64 [ %indvars.iv92.unr, %.lr.ph24.new ], [ %indvars.iv.next93.3, %102 ]
  %103 = phi double [ %.unr168, %.lr.ph24.new ], [ %125, %102 ]
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv92
  %105 = bitcast double* %104 to <2 x double>*
  %106 = getelementptr inbounds double, double* %4, i64 %indvars.iv92
  %107 = bitcast double* %106 to <2 x double>*
  %108 = load <2 x double>, <2 x double>* %105, align 8
  %109 = load <2 x double>, <2 x double>* %107, align 8
  %110 = fmul <2 x double> %108, %109
  %111 = extractelement <2 x double> %110, i32 0
  %112 = extractelement <2 x double> %110, i32 1
  %113 = fsub double %103, %111
  %114 = fsub double %113, %112
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv.next93.1
  %116 = bitcast double* %115 to <2 x double>*
  %117 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next93.1
  %118 = bitcast double* %117 to <2 x double>*
  %indvars.iv.next93.2 = add nsw i64 %indvars.iv92, 3
  %119 = load <2 x double>, <2 x double>* %116, align 8
  %120 = load <2 x double>, <2 x double>* %118, align 8
  %121 = fmul <2 x double> %119, %120
  %122 = extractelement <2 x double> %121, i32 0
  %123 = extractelement <2 x double> %121, i32 1
  %124 = fsub double %114, %122
  %125 = fsub double %124, %123
  %exitcond129.3 = icmp eq i64 %indvars.iv.next93.2, %87
  %indvars.iv.next93.3 = add nsw i64 %indvars.iv92, 4
  br i1 %exitcond129.3, label %._crit_edge25.unr-lcssa, label %102

._crit_edge25.unr-lcssa:                          ; preds = %102
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %.prol.loopexit164, %._crit_edge25.unr-lcssa
  %.lcssa158 = phi double [ %.lcssa158.unr, %.prol.loopexit164 ], [ %125, %._crit_edge25.unr-lcssa ]
  %126 = bitcast double %.lcssa158 to i64
  br label %._crit_edge73

._crit_edge73:                                    ; preds = %84, %._crit_edge25
  %127 = phi i64 [ %90, %84 ], [ %126, %._crit_edge25 ]
  %128 = getelementptr inbounds double, double* %4, i64 %indvars.iv98
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next99 = add i64 %indvars.iv98, 1
  %130 = icmp slt i64 %indvars.iv.next99, %10
  %indvars.iv.next128 = add i32 %indvars.iv127, 1
  br i1 %130, label %84, label %._crit_edge9._crit_edge

._crit_edge9._crit_edge:                          ; preds = %._crit_edge73
  br i1 true, label %.lr.ph17, label %._crit_edge9._crit_edge.._crit_edge76_crit_edge

._crit_edge9._crit_edge.._crit_edge76_crit_edge:  ; preds = %._crit_edge9._crit_edge
  br label %._crit_edge76

.lr.ph17:                                         ; preds = %._crit_edge9._crit_edge
  %storemerge215 = add i32 %0, -1
  %131 = sext i32 %storemerge215 to i64
  %132 = add nsw i64 %131, 1
  br label %133

; <label>:133:                                    ; preds = %._crit_edge77, %.lr.ph17
  %indvar = phi i32 [ %indvar.next, %._crit_edge77 ], [ 0, %.lr.ph17 ]
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %._crit_edge77 ], [ %131, %.lr.ph17 ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge77 ], [ %0, %.lr.ph17 ]
  %134 = sub i32 %0, %indvar
  %135 = sext i32 %134 to i64
  %136 = sub nsw i64 %131, %135
  %137 = getelementptr inbounds double, double* %4, i64 %indvars.iv89
  %138 = load double, double* %137, align 8
  %139 = add nsw i64 %indvars.iv89, 1
  %140 = icmp slt i64 %139, %10
  br i1 %140, label %.lr.ph, label %._crit_edge77

.lr.ph:                                           ; preds = %133
  %141 = sub nsw i64 %132, %135
  %142 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %141, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %143

; <label>:143:                                    ; preds = %143, %.prol.preheader
  %indvars.iv87.prol = phi i64 [ %indvars.iv.next88.prol, %143 ], [ %142, %.prol.preheader ]
  %144 = phi double [ %150, %143 ], [ %138, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %143 ], [ %xtraiter, %.prol.preheader ]
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv87.prol
  %146 = load double, double* %145, align 8
  %147 = getelementptr inbounds double, double* %3, i64 %indvars.iv87.prol
  %148 = load double, double* %147, align 8
  %149 = fmul double %146, %148
  %150 = fsub double %144, %149
  %indvars.iv.next88.prol = add nsw i64 %indvars.iv87.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %143, !llvm.loop !26

.prol.loopexit.unr-lcssa:                         ; preds = %143
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %150, %.prol.loopexit.unr-lcssa ]
  %indvars.iv87.unr = phi i64 [ %142, %.lr.ph ], [ %indvars.iv.next88.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %138, %.lr.ph ], [ %150, %.prol.loopexit.unr-lcssa ]
  %151 = icmp ult i64 %136, 3
  br i1 %151, label %._crit_edge12, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %152

; <label>:152:                                    ; preds = %152, %.lr.ph.new
  %indvars.iv87 = phi i64 [ %indvars.iv87.unr, %.lr.ph.new ], [ %indvars.iv.next88.3, %152 ]
  %153 = phi double [ %.unr, %.lr.ph.new ], [ %175, %152 ]
  %154 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv87
  %155 = bitcast double* %154 to <2 x double>*
  %156 = getelementptr inbounds double, double* %3, i64 %indvars.iv87
  %157 = bitcast double* %156 to <2 x double>*
  %158 = load <2 x double>, <2 x double>* %155, align 8
  %159 = load <2 x double>, <2 x double>* %157, align 8
  %160 = fmul <2 x double> %158, %159
  %161 = extractelement <2 x double> %160, i32 0
  %162 = extractelement <2 x double> %160, i32 1
  %163 = fsub double %153, %161
  %164 = fsub double %163, %162
  %indvars.iv.next88.1 = add nsw i64 %indvars.iv87, 2
  %165 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv.next88.1
  %166 = bitcast double* %165 to <2 x double>*
  %167 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next88.1
  %168 = bitcast double* %167 to <2 x double>*
  %indvars.iv.next88.2 = add nsw i64 %indvars.iv87, 3
  %169 = load <2 x double>, <2 x double>* %166, align 8
  %170 = load <2 x double>, <2 x double>* %168, align 8
  %171 = fmul <2 x double> %169, %170
  %172 = extractelement <2 x double> %171, i32 0
  %173 = extractelement <2 x double> %171, i32 1
  %174 = fsub double %164, %172
  %175 = fsub double %174, %173
  %exitcond.3 = icmp eq i64 %indvars.iv.next88.2, %131
  %indvars.iv.next88.3 = add nsw i64 %indvars.iv87, 4
  br i1 %exitcond.3, label %._crit_edge12.unr-lcssa, label %152

._crit_edge12.unr-lcssa:                          ; preds = %152
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %.prol.loopexit, %._crit_edge12.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %175, %._crit_edge12.unr-lcssa ]
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %133, %._crit_edge12
  %176 = phi double [ %138, %133 ], [ %.lcssa, %._crit_edge12 ]
  %177 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv89
  %178 = load double, double* %177, align 8
  %179 = fdiv double %176, %178
  %180 = getelementptr inbounds double, double* %3, i64 %indvars.iv89
  store double %179, double* %180, align 8
  %indvars.iv.next90 = add i64 %indvars.iv89, -1
  %181 = icmp sgt i64 %indvars.iv89, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br i1 %181, label %133, label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge77
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge9._crit_edge.._crit_edge76_crit_edge, %._crit_edge9._crit_edge.thread, %._crit_edge18
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %._crit_edge1

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2

; <label>:12:                                     ; preds = %._crit_edge3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  br i1 %18, label %._crit_edge3, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %2, %._crit_edge
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!8, !5}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.vectorize.width", i32 1}
!14 = !{!"llvm.loop.interleave.count", i32 1}
!15 = distinct !{!15, !13, !14}
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !13, !14}
!22 = distinct !{!22, !2}
!23 = distinct !{!23, !13, !14}
!24 = distinct !{!24, !2}
!25 = distinct !{!25, !2}
!26 = distinct !{!26, !2}
