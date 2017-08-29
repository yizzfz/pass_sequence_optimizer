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
  %11 = bitcast i8* %6 to double*
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %11)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %12 = icmp sgt i32 %0, 42
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %2
  %14 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %14, align 1
  %15 = icmp eq i8 %strcmpload, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %13
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %13, %2, %16
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
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
  br i1 %10, label %.lr.ph67, label %.preheader16.thread

.preheader16.thread:                              ; preds = %5
  br label %.preheader16._crit_edge

.lr.ph67:                                         ; preds = %5
  %11 = sext i32 %0 to i64
  %xtraiter143 = and i64 %11, 1
  %lcmp.mod144 = icmp eq i64 %xtraiter143, 0
  br i1 %lcmp.mod144, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph67
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %12 = fdiv double 1.000000e+00, %9
  %13 = fmul double %12, 5.000000e-01
  %14 = fadd double %13, 4.000000e+00
  store double %14, double* %2, align 8
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %.lr.ph67, %._crit_edge.prol
  %indvars.iv129.unr = phi i64 [ 0, %.lr.ph67 ], [ 1, %._crit_edge.prol ]
  %storemerge65.unr = phi i64 [ 0, %.lr.ph67 ], [ 1, %._crit_edge.prol ]
  %15 = icmp eq i32 %0, 1
  br i1 %15, label %.preheader16, label %.lr.ph67.new

.lr.ph67.new:                                     ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

.preheader16.unr-lcssa:                           ; preds = %._crit_edge
  br label %.preheader16

.preheader16:                                     ; preds = %._crit_edge.prol.loopexit, %.preheader16.unr-lcssa
  br i1 true, label %.preheader15.lr.ph, label %.preheader16..preheader16._crit_edge_crit_edge

.preheader16..preheader16._crit_edge_crit_edge:   ; preds = %.preheader16
  br label %.preheader16._crit_edge

.preheader15.lr.ph:                               ; preds = %.preheader16
  %16 = add i32 %0, -1
  %wide.trip.count = sext i32 %16 to i64
  br label %.preheader15

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph67.new
  %indvars.iv129 = phi i64 [ %indvars.iv129.unr, %.lr.ph67.new ], [ %indvars.iv.next130.1, %._crit_edge ]
  %storemerge65 = phi i64 [ %storemerge65.unr, %.lr.ph67.new ], [ %indvars.iv.next130.1, %._crit_edge ]
  %sext = shl i64 %storemerge65, 32
  %17 = ashr exact i64 %sext, 32
  %18 = getelementptr inbounds double, double* %3, i64 %17
  store double 0.000000e+00, double* %18, align 8
  %19 = getelementptr inbounds double, double* %4, i64 %indvars.iv129
  store double 0.000000e+00, double* %19, align 8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %20 = trunc i64 %indvars.iv.next130 to i32
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %9
  %23 = fmul double %22, 5.000000e-01
  %24 = fadd double %23, 4.000000e+00
  %25 = getelementptr inbounds double, double* %2, i64 %indvars.iv129
  store double %24, double* %25, align 8
  %sext.1 = shl i64 %indvars.iv.next130, 32
  %26 = ashr exact i64 %sext.1, 32
  %27 = getelementptr inbounds double, double* %3, i64 %26
  store double 0.000000e+00, double* %27, align 8
  %28 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next130
  store double 0.000000e+00, double* %28, align 8
  %indvars.iv.next130.1 = add nsw i64 %indvars.iv129, 2
  %29 = trunc i64 %indvars.iv.next130.1 to i32
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, %9
  %32 = fmul double %31, 5.000000e-01
  %33 = fadd double %32, 4.000000e+00
  %34 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next130
  store double %33, double* %34, align 8
  %35 = icmp slt i64 %indvars.iv.next130.1, %11
  br i1 %35, label %._crit_edge, label %.preheader16.unr-lcssa

.preheader15:                                     ; preds = %._crit_edge55..preheader15_crit_edge, %.preheader15.lr.ph
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %._crit_edge55..preheader15_crit_edge ], [ 0, %.preheader15.lr.ph ]
  %indvars.iv123.in = phi i32 [ %indvars.iv123, %._crit_edge55..preheader15_crit_edge ], [ 0, %.preheader15.lr.ph ]
  %indvars.iv119 = phi i32 [ %indvars.iv.next120, %._crit_edge55..preheader15_crit_edge ], [ 0, %.preheader15.lr.ph ]
  %indvars.iv123 = add i32 %indvars.iv123.in, 1
  %36 = sext i32 %indvars.iv123 to i64
  %37 = icmp slt i64 %indvars.iv127, 0
  br i1 %37, label %.preheader14, label %.lr.ph49

.lr.ph49:                                         ; preds = %.preheader15
  %wide.trip.count121 = zext i32 %indvars.iv119 to i64
  br label %39

.preheader14.loopexit:                            ; preds = %39
  br label %.preheader14

.preheader14:                                     ; preds = %.preheader14.loopexit, %.preheader15
  %indvars.iv.next128 = add i64 %indvars.iv127, 1
  %38 = icmp slt i64 %indvars.iv.next128, %11
  br i1 %38, label %.lr.ph54.preheader, label %._crit_edge55

.lr.ph54.preheader:                               ; preds = %.preheader14
  br label %.lr.ph54

; <label>:39:                                     ; preds = %._crit_edge137, %.lr.ph49
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %._crit_edge137 ], [ 0, %.lr.ph49 ]
  %40 = sub nsw i64 0, %indvars.iv115
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, %0
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %9
  %45 = fadd double %44, 1.000000e+00
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv127, i64 %indvars.iv115
  store double %45, double* %46, align 8
  %exitcond122 = icmp eq i64 %indvars.iv115, %wide.trip.count121
  br i1 %exitcond122, label %.preheader14.loopexit, label %._crit_edge137

._crit_edge137:                                   ; preds = %39
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  br label %39

.lr.ph54:                                         ; preds = %.lr.ph54.preheader, %.lr.ph54..lr.ph54_crit_edge
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %.lr.ph54..lr.ph54_crit_edge ], [ %36, %.lr.ph54.preheader ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv127, i64 %indvars.iv125
  store double 0.000000e+00, double* %47, align 8
  %exitcond = icmp eq i64 %indvars.iv125, %wide.trip.count
  br i1 %exitcond, label %._crit_edge55.loopexit, label %.lr.ph54..lr.ph54_crit_edge

.lr.ph54..lr.ph54_crit_edge:                      ; preds = %.lr.ph54
  %indvars.iv.next126 = add nsw i64 %indvars.iv125, 1
  br label %.lr.ph54

._crit_edge55.loopexit:                           ; preds = %.lr.ph54
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %.preheader14
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv127, i64 %indvars.iv127
  store double 1.000000e+00, double* %48, align 8
  br i1 %38, label %._crit_edge55..preheader15_crit_edge, label %._crit_edge60

._crit_edge55..preheader15_crit_edge:             ; preds = %._crit_edge55
  %indvars.iv.next120 = add i32 %indvars.iv119, 1
  br label %.preheader15

._crit_edge60:                                    ; preds = %._crit_edge55
  br label %.preheader16._crit_edge

.preheader16._crit_edge:                          ; preds = %.preheader16..preheader16._crit_edge_crit_edge, %.preheader16.thread, %._crit_edge60
  %49 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %50 = bitcast [2000 x [2000 x double]]** %8 to i8**
  store i8* %49, i8** %50, align 8
  %51 = bitcast i8* %49 to [2000 x [2000 x double]]*
  br i1 %10, label %.preheader13.lr.ph, label %.preheader12.thread

.preheader12.thread:                              ; preds = %.preheader16._crit_edge
  br label %.preheader9

.preheader13.lr.ph:                               ; preds = %.preheader16._crit_edge
  br i1 true, label %.preheader13.lr.ph..preheader13.us_crit_edge, label %.preheader13.lr.ph..preheader12_crit_edge

.preheader13.lr.ph..preheader12_crit_edge:        ; preds = %.preheader13.lr.ph
  br label %.preheader12

.preheader13.lr.ph..preheader13.us_crit_edge:     ; preds = %.preheader13.lr.ph
  %52 = add i32 %0, -1
  %53 = zext i32 %52 to i64
  %54 = shl nuw nsw i64 %53, 3
  %55 = add nuw nsw i64 %54, 8
  %56 = sext i32 %0 to i64
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %._crit_edge41.us.._crit_edge41.us_crit_edge, %.preheader13.lr.ph..preheader13.us_crit_edge
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge41.us.._crit_edge41.us_crit_edge ], [ 0, %.preheader13.lr.ph..preheader13.us_crit_edge ]
  %indvar = phi i64 [ %indvar.next, %._crit_edge41.us.._crit_edge41.us_crit_edge ], [ 0, %.preheader13.lr.ph..preheader13.us_crit_edge ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvar, i64 0
  %scevgep111 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111, i8 0, i64 %55, i32 8, i1 false)
  %indvars.iv.next113 = add i64 %indvars.iv112, 1
  %57 = icmp slt i64 %indvars.iv.next113, %56
  br i1 %57, label %._crit_edge41.us.._crit_edge41.us_crit_edge, label %.preheader12.loopexit

._crit_edge41.us.._crit_edge41.us_crit_edge:      ; preds = %._crit_edge41.us
  %indvar.next = add i64 %indvar, 1
  br label %._crit_edge41.us

.preheader12.loopexit:                            ; preds = %._crit_edge41.us
  %.pr135.pre = load i32, i32* %6, align 4
  br label %.preheader12

.preheader12:                                     ; preds = %.preheader13.lr.ph..preheader12_crit_edge, %.preheader12.loopexit
  %58 = phi i32 [ %0, %.preheader13.lr.ph..preheader12_crit_edge ], [ %.pr135.pre, %.preheader12.loopexit ]
  %59 = icmp sgt i32 %58, 0
  br i1 %59, label %.preheader11.lr.ph, label %.preheader9

.preheader11.lr.ph:                               ; preds = %.preheader12
  %60 = load [2000 x double]*, [2000 x double]** %7, align 8
  %61 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  br i1 true, label %.preheader11.lr.ph..preheader11.us_crit_edge, label %.preheader11.preheader

.preheader11.preheader:                           ; preds = %.preheader11.lr.ph
  br i1 undef, label %.preheader11.prol.preheader, label %.preheader11.prol.loopexit

.preheader11.prol.preheader:                      ; preds = %.preheader11.preheader
  br label %.preheader11.prol

.preheader11.prol:                                ; preds = %.preheader11.prol, %.preheader11.prol.preheader
  br i1 false, label %.preheader11.prol, label %.preheader11.prol.loopexit.unr-lcssa, !llvm.loop !1

.preheader11.prol.loopexit.unr-lcssa:             ; preds = %.preheader11.prol
  br label %.preheader11.prol.loopexit

.preheader11.prol.loopexit:                       ; preds = %.preheader11.prol.loopexit.unr-lcssa, %.preheader11.preheader
  br i1 undef, label %..preheader9_crit_edge.loopexit, label %.preheader11.preheader.new

.preheader11.preheader.new:                       ; preds = %.preheader11.prol.loopexit
  br label %.preheader11

.preheader11.lr.ph..preheader11.us_crit_edge:     ; preds = %.preheader11.lr.ph
  %62 = add i32 %58, -1
  %63 = sext i32 %58 to i64
  %wide.trip.count103 = zext i32 %62 to i64
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge28.us-lcssa.us.us, %.preheader11.lr.ph..preheader11.us_crit_edge
  %indvars.iv107 = phi i64 [ 0, %.preheader11.lr.ph..preheader11.us_crit_edge ], [ %indvars.iv.next108, %._crit_edge28.us-lcssa.us.us ]
  br i1 true, label %.preheader10.lr.ph.us, label %.preheader11.us.._crit_edge28.us-lcssa.us.us_crit_edge

.preheader11.us.._crit_edge28.us-lcssa.us.us_crit_edge: ; preds = %.preheader11.us
  br label %._crit_edge28.us-lcssa.us.us

.preheader10.lr.ph.us:                            ; preds = %.preheader11.us
  br label %.preheader10.us.us

._crit_edge28.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge26.us.us
  br label %._crit_edge28.us-lcssa.us.us

._crit_edge28.us-lcssa.us.us:                     ; preds = %.preheader11.us.._crit_edge28.us-lcssa.us.us_crit_edge, %._crit_edge28.us-lcssa.us.us.loopexit
  %indvars.iv.next108 = add i64 %indvars.iv107, 1
  %64 = icmp slt i64 %indvars.iv.next108, %63
  br i1 %64, label %.preheader11.us, label %._crit_edge28.us-lcssa.us.us...preheader9_crit_edge_crit_edge

._crit_edge28.us-lcssa.us.us...preheader9_crit_edge_crit_edge: ; preds = %._crit_edge28.us-lcssa.us.us
  br label %..preheader9_crit_edge

.preheader10.us.us:                               ; preds = %._crit_edge26.us.us, %.preheader10.lr.ph.us
  %indvars.iv105 = phi i64 [ 0, %.preheader10.lr.ph.us ], [ %indvars.iv.next106, %._crit_edge26.us.us ]
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv105, i64 %indvars.iv107
  br label %67

._crit_edge26.us.us:                              ; preds = %67
  %indvars.iv.next106 = add i64 %indvars.iv105, 1
  %66 = icmp slt i64 %indvars.iv.next106, %63
  br i1 %66, label %.preheader10.us.us, label %._crit_edge28.us-lcssa.us.us.loopexit

; <label>:67:                                     ; preds = %._crit_edge138, %.preheader10.us.us
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %._crit_edge138 ], [ 0, %.preheader10.us.us ]
  %68 = load double, double* %65, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv101, i64 %indvars.iv107
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %61, i64 0, i64 %indvars.iv105, i64 %indvars.iv101
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  store double %74, double* %72, align 8
  %exitcond104 = icmp eq i64 %indvars.iv101, %wide.trip.count103
  br i1 %exitcond104, label %._crit_edge26.us.us, label %._crit_edge138

._crit_edge138:                                   ; preds = %67
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  br label %67

.preheader11:                                     ; preds = %.preheader11, %.preheader11.preheader.new
  br i1 false, label %.preheader11, label %..preheader9_crit_edge.loopexit.unr-lcssa

..preheader9_crit_edge.loopexit.unr-lcssa:        ; preds = %.preheader11
  br label %..preheader9_crit_edge.loopexit

..preheader9_crit_edge.loopexit:                  ; preds = %.preheader11.prol.loopexit, %..preheader9_crit_edge.loopexit.unr-lcssa
  br label %..preheader9_crit_edge

..preheader9_crit_edge:                           ; preds = %..preheader9_crit_edge.loopexit, %._crit_edge28.us-lcssa.us.us...preheader9_crit_edge_crit_edge
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader12, %.preheader12.thread, %..preheader9_crit_edge
  %75 = phi i32 [ %58, %.preheader12 ], [ %0, %.preheader12.thread ], [ %58, %..preheader9_crit_edge ]
  %76 = icmp sgt i32 %75, 0
  br i1 %76, label %.preheader.lr.ph, label %.preheader9..preheader9._crit_edge_crit_edge

.preheader9..preheader9._crit_edge_crit_edge:     ; preds = %.preheader9
  %.pre = load i8*, i8** %50, align 8
  br label %.preheader9._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader9
  %77 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %78 = load [2000 x double]*, [2000 x double]** %7, align 8
  %79 = bitcast [2000 x [2000 x double]]* %77 to i8*
  br i1 true, label %.preheader.lr.ph..preheader.us_crit_edge, label %.preheader.._crit_edge20_crit_edge

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %.preheader.lr.ph
  %80 = add i32 %75, -1
  %81 = sext i32 %75 to i64
  %wide.trip.count97 = zext i32 %80 to i64
  %xtraiter = and i64 %81, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %.preheader.us.prol.preheader

.preheader.us.prol.preheader:                     ; preds = %.preheader.lr.ph..preheader.us_crit_edge
  br label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.prol.preheader
  br label %82

; <label>:82:                                     ; preds = %._crit_edge139.prol, %.preheader.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge139.prol ], [ 0, %.preheader.us.prol ]
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 0, i64 %indvars.iv.prol
  %84 = bitcast double* %83 to i64*
  %85 = load i64, i64* %84, align 8
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %78, i64 0, i64 %indvars.iv.prol
  %87 = bitcast double* %86 to i64*
  store i64 %85, i64* %87, align 8
  %exitcond98.prol = icmp eq i64 %indvars.iv.prol, %wide.trip.count97
  br i1 %exitcond98.prol, label %._crit_edge.us.prol, label %._crit_edge139.prol

._crit_edge139.prol:                              ; preds = %82
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %82

._crit_edge.us.prol:                              ; preds = %82
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.lr.ph..preheader.us_crit_edge, %._crit_edge.us.prol
  %indvars.iv99.unr = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ 1, %._crit_edge.us.prol ]
  %88 = icmp eq i32 %75, 1
  br i1 %88, label %._crit_edge.us.._crit_edge20_crit_edge, label %.preheader.lr.ph..preheader.us_crit_edge.new

.preheader.lr.ph..preheader.us_crit_edge.new:     ; preds = %.preheader.us.prol.loopexit
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us.1, %.preheader.lr.ph..preheader.us_crit_edge.new
  %indvars.iv99 = phi i64 [ %indvars.iv99.unr, %.preheader.lr.ph..preheader.us_crit_edge.new ], [ %indvars.iv.next100.1, %._crit_edge.us.1 ]
  br label %89

; <label>:89:                                     ; preds = %._crit_edge139, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge139 ], [ 0, %.preheader.us ]
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv99, i64 %indvars.iv
  %91 = bitcast double* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %78, i64 %indvars.iv99, i64 %indvars.iv
  %94 = bitcast double* %93 to i64*
  store i64 %92, i64* %94, align 8
  %exitcond98 = icmp eq i64 %indvars.iv, %wide.trip.count97
  br i1 %exitcond98, label %._crit_edge.us, label %._crit_edge139

._crit_edge139:                                   ; preds = %89
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %89

._crit_edge.us:                                   ; preds = %89
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  br label %96

._crit_edge.us.._crit_edge20_crit_edge.unr-lcssa: ; preds = %._crit_edge.us.1
  br label %._crit_edge.us.._crit_edge20_crit_edge

._crit_edge.us.._crit_edge20_crit_edge:           ; preds = %.preheader.us.prol.loopexit, %._crit_edge.us.._crit_edge20_crit_edge.unr-lcssa
  br label %._crit_edge20

.preheader.._crit_edge20_crit_edge:               ; preds = %.preheader.lr.ph
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %.preheader.._crit_edge20_crit_edge, %._crit_edge.us.._crit_edge20_crit_edge
  br label %.preheader9._crit_edge

.preheader9._crit_edge:                           ; preds = %.preheader9..preheader9._crit_edge_crit_edge, %._crit_edge20
  %95 = phi i8* [ %.pre, %.preheader9..preheader9._crit_edge_crit_edge ], [ %79, %._crit_edge20 ]
  tail call void @free(i8* %95) #4
  ret void

; <label>:96:                                     ; preds = %._crit_edge139.1, %._crit_edge.us
  %indvars.iv.1 = phi i64 [ %indvars.iv.next.1, %._crit_edge139.1 ], [ 0, %._crit_edge.us ]
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv.next100, i64 %indvars.iv.1
  %98 = bitcast double* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %78, i64 %indvars.iv.next100, i64 %indvars.iv.1
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %exitcond98.1 = icmp eq i64 %indvars.iv.1, %wide.trip.count97
  br i1 %exitcond98.1, label %._crit_edge.us.1, label %._crit_edge139.1

._crit_edge139.1:                                 ; preds = %96
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  br label %96

._crit_edge.us.1:                                 ; preds = %96
  %indvars.iv.next100.1 = add nsw i64 %indvars.iv99, 2
  %102 = icmp slt i64 %indvars.iv.next100.1, %81
  br i1 %102, label %.preheader.us, label %._crit_edge.us.._crit_edge20_crit_edge.unr-lcssa
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader11.lr.ph, label %.preheader9

.preheader11.lr.ph:                               ; preds = %5
  %7 = add i32 %0, -1
  %8 = sext i32 %0 to i64
  %wide.trip.count130 = sext i32 %7 to i64
  br label %.preheader11

.preheader11:                                     ; preds = %._crit_edge65..preheader11_crit_edge, %.preheader11.lr.ph
  %indvars.iv147 = phi i64 [ %indvars.iv.next148, %._crit_edge65..preheader11_crit_edge ], [ 0, %.preheader11.lr.ph ]
  %indvars.iv139 = phi i32 [ %9, %._crit_edge65..preheader11_crit_edge ], [ -1, %.preheader11.lr.ph ]
  %9 = add i32 %indvars.iv139, 1
  %10 = icmp sgt i64 %indvars.iv147, 0
  br i1 %10, label %.lr.ph49.preheader, label %.preheader10

.lr.ph49.preheader:                               ; preds = %.preheader11
  br label %.lr.ph49

..preheader9_crit_edge:                           ; preds = %._crit_edge65
  br label %.preheader9

.preheader9:                                      ; preds = %5, %..preheader9_crit_edge
  br i1 %6, label %.lr.ph34, label %.preheader.thread

.preheader.thread:                                ; preds = %.preheader9
  br label %.preheader._crit_edge

.lr.ph34:                                         ; preds = %.preheader9
  %11 = sext i32 %0 to i64
  br label %44

.preheader10.loopexit:                            ; preds = %._crit_edge80
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11
  %12 = icmp slt i64 %indvars.iv147, %8
  br i1 %12, label %.lr.ph64, label %._crit_edge65

.lr.ph64:                                         ; preds = %.preheader10
  br i1 %10, label %.lr.ph64.split.us.preheader, label %.lr.ph64.split.preheader

.lr.ph64.split.preheader:                         ; preds = %.lr.ph64
  br label %.lr.ph64.split

.lr.ph64.split.us.preheader:                      ; preds = %.lr.ph64
  %wide.trip.count141 = zext i32 %indvars.iv139 to i64
  br label %.lr.ph64.split.us

.lr.ph64.split.us:                                ; preds = %._crit_edge57.us, %.lr.ph64.split.us.preheader
  %indvars.iv145 = phi i64 [ %indvars.iv147, %.lr.ph64.split.us.preheader ], [ %indvars.iv.next146, %._crit_edge57.us ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv145
  %14 = load double, double* %13, align 8
  br label %15

; <label>:15:                                     ; preds = %._crit_edge160, %.lr.ph64.split.us
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge160 ], [ 0, %.lr.ph64.split.us ]
  %16 = phi double [ %22, %._crit_edge160 ], [ %14, %.lr.ph64.split.us ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv133
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv133, i64 %indvars.iv145
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  %exitcond142 = icmp eq i64 %indvars.iv133, %wide.trip.count141
  br i1 %exitcond142, label %._crit_edge57.us, label %._crit_edge160

._crit_edge160:                                   ; preds = %15
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  br label %15

._crit_edge57.us:                                 ; preds = %15
  store double %22, double* %13, align 8
  %indvars.iv.next146 = add i64 %indvars.iv145, 1
  %23 = icmp slt i64 %indvars.iv.next146, %8
  br i1 %23, label %.lr.ph64.split.us, label %._crit_edge65.loopexit

.lr.ph49:                                         ; preds = %.lr.ph49.preheader, %._crit_edge80..lr.ph49_crit_edge
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %._crit_edge80..lr.ph49_crit_edge ], [ 0, %.lr.ph49.preheader ]
  %indvars.iv120 = phi i32 [ %24, %._crit_edge80..lr.ph49_crit_edge ], [ -1, %.lr.ph49.preheader ]
  %24 = add i32 %indvars.iv120, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv124
  %26 = load double, double* %25, align 8
  %27 = icmp sgt i64 %indvars.iv124, 0
  br i1 %27, label %.lr.ph41, label %._crit_edge80

.lr.ph41:                                         ; preds = %.lr.ph49
  %wide.trip.count122 = zext i32 %indvars.iv120 to i64
  br label %28

; <label>:28:                                     ; preds = %._crit_edge161, %.lr.ph41
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge161 ], [ 0, %.lr.ph41 ]
  %29 = phi double [ %35, %._crit_edge161 ], [ %26, %.lr.ph41 ]
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv114
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv124
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %29, %34
  %exitcond123 = icmp eq i64 %indvars.iv114, %wide.trip.count122
  br i1 %exitcond123, label %._crit_edge42, label %._crit_edge161

._crit_edge161:                                   ; preds = %28
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  br label %28

._crit_edge42:                                    ; preds = %28
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %.lr.ph49, %._crit_edge42
  %36 = phi double [ %35, %._crit_edge42 ], [ %26, %.lr.ph49 ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv124, i64 %indvars.iv124
  %38 = load double, double* %37, align 8
  %39 = fdiv double %36, %38
  store double %39, double* %25, align 8
  %indvars.iv.next125 = add nuw i64 %indvars.iv124, 1
  %40 = icmp slt i64 %indvars.iv.next125, %indvars.iv147
  br i1 %40, label %._crit_edge80..lr.ph49_crit_edge, label %.preheader10.loopexit

._crit_edge80..lr.ph49_crit_edge:                 ; preds = %._crit_edge80
  br label %.lr.ph49

.lr.ph64.split:                                   ; preds = %.lr.ph64.split.preheader, %.lr.ph64.split..lr.ph64.split_crit_edge
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %.lr.ph64.split..lr.ph64.split_crit_edge ], [ %indvars.iv147, %.lr.ph64.split.preheader ]
  %exitcond131 = icmp eq i64 %indvars.iv128, %wide.trip.count130
  br i1 %exitcond131, label %._crit_edge65.loopexit149, label %.lr.ph64.split..lr.ph64.split_crit_edge

.lr.ph64.split..lr.ph64.split_crit_edge:          ; preds = %.lr.ph64.split
  %indvars.iv.next129 = add i64 %indvars.iv128, 1
  br label %.lr.ph64.split

._crit_edge65.loopexit149:                        ; preds = %.lr.ph64.split
  br label %._crit_edge65

._crit_edge65.loopexit:                           ; preds = %._crit_edge57.us
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.loopexit, %.preheader10, %._crit_edge65.loopexit149
  %indvars.iv.next148 = add i64 %indvars.iv147, 1
  %41 = icmp slt i64 %indvars.iv.next148, %8
  br i1 %41, label %._crit_edge65..preheader11_crit_edge, label %..preheader9_crit_edge

._crit_edge65..preheader11_crit_edge:             ; preds = %._crit_edge65
  br label %.preheader11

.preheader:                                       ; preds = %._crit_edge83
  %42 = add i32 %0, -1
  br i1 true, label %.lr.ph20, label %.preheader..preheader._crit_edge_crit_edge

.preheader..preheader._crit_edge_crit_edge:       ; preds = %.preheader
  br label %.preheader._crit_edge

.lr.ph20:                                         ; preds = %.preheader
  %43 = sext i32 %42 to i64
  br label %64

; <label>:44:                                     ; preds = %._crit_edge83._crit_edge, %.lr.ph34
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge83._crit_edge ], [ 0, %.lr.ph34 ]
  %indvars.iv108 = phi i32 [ %indvars.iv.next109, %._crit_edge83._crit_edge ], [ -1, %.lr.ph34 ]
  %storemerge133 = phi i64 [ %indvars.iv.next113, %._crit_edge83._crit_edge ], [ 0, %.lr.ph34 ]
  %sext = shl i64 %storemerge133, 32
  %45 = ashr exact i64 %sext, 32
  %46 = getelementptr inbounds double, double* %2, i64 %45
  %47 = bitcast double* %46 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = icmp sgt i64 %indvars.iv112, 0
  br i1 %49, label %.lr.ph27, label %._crit_edge83

.lr.ph27:                                         ; preds = %44
  %50 = bitcast i64 %48 to double
  %wide.trip.count110 = zext i32 %indvars.iv108 to i64
  br label %51

; <label>:51:                                     ; preds = %._crit_edge162, %.lr.ph27
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge162 ], [ 0, %.lr.ph27 ]
  %52 = phi double [ %58, %._crit_edge162 ], [ %50, %.lr.ph27 ]
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv102
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds double, double* %4, i64 %indvars.iv102
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fsub double %52, %57
  %exitcond111 = icmp eq i64 %indvars.iv102, %wide.trip.count110
  br i1 %exitcond111, label %._crit_edge28, label %._crit_edge162

._crit_edge162:                                   ; preds = %51
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  br label %51

._crit_edge28:                                    ; preds = %51
  %59 = bitcast double %58 to i64
  br label %._crit_edge83

._crit_edge83:                                    ; preds = %44, %._crit_edge28
  %60 = phi i64 [ %48, %44 ], [ %59, %._crit_edge28 ]
  %61 = getelementptr inbounds double, double* %4, i64 %indvars.iv112
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next113 = add i64 %indvars.iv112, 1
  %63 = icmp slt i64 %indvars.iv.next113, %11
  br i1 %63, label %._crit_edge83._crit_edge, label %.preheader

._crit_edge83._crit_edge:                         ; preds = %._crit_edge83
  %indvars.iv.next109 = add i32 %indvars.iv108, 1
  br label %44

; <label>:64:                                     ; preds = %._crit_edge86._crit_edge, %.lr.ph20
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %._crit_edge86._crit_edge ], [ %43, %.lr.ph20 ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge86._crit_edge ], [ %0, %.lr.ph20 ]
  %65 = phi i32 [ %86, %._crit_edge86._crit_edge ], [ %42, %.lr.ph20 ]
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds double, double* %4, i64 %66
  %68 = load double, double* %67, align 8
  %69 = add nsw i64 %indvars.iv99, 1
  %70 = icmp slt i64 %69, %11
  br i1 %70, label %.lr.ph, label %._crit_edge86

.lr.ph:                                           ; preds = %64
  %71 = sext i32 %indvars.iv to i64
  br label %72

; <label>:72:                                     ; preds = %._crit_edge163, %.lr.ph
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge163 ], [ %71, %.lr.ph ]
  %73 = phi double [ %79, %._crit_edge163 ], [ %68, %.lr.ph ]
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv97
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds double, double* %3, i64 %indvars.iv97
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fsub double %73, %78
  %exitcond = icmp eq i64 %indvars.iv97, %43
  br i1 %exitcond, label %._crit_edge, label %._crit_edge163

._crit_edge163:                                   ; preds = %72
  %indvars.iv.next98 = add nsw i64 %indvars.iv97, 1
  br label %72

._crit_edge:                                      ; preds = %72
  br label %._crit_edge86

._crit_edge86:                                    ; preds = %64, %._crit_edge
  %80 = phi double [ %68, %64 ], [ %79, %._crit_edge ]
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv99
  %82 = load double, double* %81, align 8
  %83 = fdiv double %80, %82
  %84 = getelementptr inbounds double, double* %3, i64 %indvars.iv99
  store double %83, double* %84, align 8
  %indvars.iv.next100 = add i64 %indvars.iv99, -1
  %85 = icmp sgt i64 %indvars.iv99, 0
  br i1 %85, label %._crit_edge86._crit_edge, label %._crit_edge21

._crit_edge86._crit_edge:                         ; preds = %._crit_edge86
  %86 = trunc i64 %indvars.iv.next100 to i32
  %indvars.iv.next = add i32 %indvars.iv, -1
  br label %64

._crit_edge21:                                    ; preds = %._crit_edge86
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader..preheader._crit_edge_crit_edge, %.preheader.thread, %._crit_edge21
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %._crit_edge2

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %._crit_edge3._crit_edge

._crit_edge3._crit_edge:                          ; preds = %._crit_edge3, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge3 ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %18, %._crit_edge3 ]
  %9 = srem i32 %storemerge1, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge3

; <label>:11:                                     ; preds = %._crit_edge3._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add i64 %indvars.iv, 1
  %17 = icmp slt i64 %indvars.iv.next, %8
  %18 = trunc i64 %indvars.iv.next to i32
  br i1 %17, label %._crit_edge3._crit_edge, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge3
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %2, %._crit_edge
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
