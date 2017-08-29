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
  br i1 %10, label %.lr.ph64, label %.preheader18.thread

.preheader18.thread:                              ; preds = %5
  br label %.preheader18._crit_edge

.lr.ph64:                                         ; preds = %5
  %11 = sext i32 %0 to i64
  %xtraiter202 = and i64 %11, 1
  %lcmp.mod203 = icmp eq i64 %xtraiter202, 0
  br i1 %lcmp.mod203, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph64
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %12 = fdiv double 1.000000e+00, %9
  %13 = fmul double %12, 5.000000e-01
  %14 = fadd double %13, 4.000000e+00
  store double %14, double* %2, align 8
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %.lr.ph64, %._crit_edge.prol
  %indvars.iv133.unr = phi i64 [ 0, %.lr.ph64 ], [ 1, %._crit_edge.prol ]
  %storemerge62.unr = phi i64 [ 0, %.lr.ph64 ], [ 1, %._crit_edge.prol ]
  %15 = icmp eq i32 %0, 1
  br i1 %15, label %.preheader18, label %.lr.ph64.new

.lr.ph64.new:                                     ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

.preheader18.unr-lcssa:                           ; preds = %._crit_edge
  br label %.preheader18

.preheader18:                                     ; preds = %._crit_edge.prol.loopexit, %.preheader18.unr-lcssa
  br i1 true, label %.preheader17.lr.ph, label %.preheader18..preheader18._crit_edge_crit_edge

.preheader18..preheader18._crit_edge_crit_edge:   ; preds = %.preheader18
  br label %.preheader18._crit_edge

.preheader17.lr.ph:                               ; preds = %.preheader18
  %16 = add i32 %0, -2
  %17 = zext i32 %16 to i64
  br label %.preheader17

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph64.new
  %indvars.iv133 = phi i64 [ %indvars.iv133.unr, %.lr.ph64.new ], [ %indvars.iv.next134.1, %._crit_edge ]
  %storemerge62 = phi i64 [ %storemerge62.unr, %.lr.ph64.new ], [ %indvars.iv.next134.1, %._crit_edge ]
  %sext139 = shl i64 %storemerge62, 32
  %18 = ashr exact i64 %sext139, 32
  %19 = getelementptr inbounds double, double* %3, i64 %18
  store double 0.000000e+00, double* %19, align 8
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv133
  store double 0.000000e+00, double* %20, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %21 = trunc i64 %indvars.iv.next134 to i32
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, %9
  %24 = fmul double %23, 5.000000e-01
  %25 = fadd double %24, 4.000000e+00
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv133
  store double %25, double* %26, align 8
  %sext139.1 = shl i64 %indvars.iv.next134, 32
  %27 = ashr exact i64 %sext139.1, 32
  %28 = getelementptr inbounds double, double* %3, i64 %27
  store double 0.000000e+00, double* %28, align 8
  %29 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next134
  store double 0.000000e+00, double* %29, align 8
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  %30 = trunc i64 %indvars.iv.next134.1 to i32
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, %9
  %33 = fmul double %32, 5.000000e-01
  %34 = fadd double %33, 4.000000e+00
  %35 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next134
  store double %34, double* %35, align 8
  %36 = icmp slt i64 %indvars.iv.next134.1, %11
  br i1 %36, label %._crit_edge, label %.preheader18.unr-lcssa

.preheader17:                                     ; preds = %._crit_edge54..preheader17_crit_edge, %.preheader17.lr.ph
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %._crit_edge54..preheader17_crit_edge ], [ 0, %.preheader17.lr.ph ]
  %indvar126 = phi i64 [ %37, %._crit_edge54..preheader17_crit_edge ], [ 0, %.preheader17.lr.ph ]
  %indvars.iv118 = phi i32 [ %indvars.iv.next119, %._crit_edge54..preheader17_crit_edge ], [ 0, %.preheader17.lr.ph ]
  %37 = add i64 %indvar126, 1
  %sext = shl i64 %37, 32
  %38 = ashr exact i64 %sext, 32
  %scevgep129 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvar126, i64 %38
  %scevgep129130 = bitcast double* %scevgep129 to i8*
  %39 = sub i64 %17, %indvar126
  %40 = shl i64 %39, 3
  %41 = and i64 %40, 34359738360
  %42 = add nuw nsw i64 %41, 8
  %43 = icmp slt i64 %indvars.iv131, 0
  br i1 %43, label %.preheader16, label %.lr.ph48.preheader

.lr.ph48.preheader:                               ; preds = %.preheader17
  %wide.trip.count120 = zext i32 %indvars.iv118 to i64
  br label %.lr.ph48

.preheader16.loopexit:                            ; preds = %.lr.ph48
  br label %.preheader16

.preheader16:                                     ; preds = %.preheader16.loopexit, %.preheader17
  %indvars.iv.next132 = add i64 %indvars.iv131, 1
  %44 = icmp slt i64 %indvars.iv.next132, %11
  br i1 %44, label %.._crit_edge54_crit_edge, label %._crit_edge54

.lr.ph48:                                         ; preds = %.lr.ph48, %.lr.ph48.preheader
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %.lr.ph48 ], [ 0, %.lr.ph48.preheader ]
  %45 = sub nsw i64 0, %indvars.iv114
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, %0
  %48 = sitofp i32 %47 to double
  %49 = fdiv double %48, %9
  %50 = fadd double %49, 1.000000e+00
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv114
  store double %50, double* %51, align 8
  %exitcond121 = icmp eq i64 %indvars.iv114, %wide.trip.count120
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  br i1 %exitcond121, label %.preheader16.loopexit, label %.lr.ph48

.._crit_edge54_crit_edge:                         ; preds = %.preheader16
  call void @llvm.memset.p0i8.i64(i8* %scevgep129130, i8 0, i64 %42, i32 8, i1 false)
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %.preheader16, %.._crit_edge54_crit_edge
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv131
  store double 1.000000e+00, double* %52, align 8
  br i1 %44, label %._crit_edge54..preheader17_crit_edge, label %._crit_edge57

._crit_edge54..preheader17_crit_edge:             ; preds = %._crit_edge54
  %indvars.iv.next119 = add i32 %indvars.iv118, 1
  br label %.preheader17

._crit_edge57:                                    ; preds = %._crit_edge54
  br label %.preheader18._crit_edge

.preheader18._crit_edge:                          ; preds = %.preheader18..preheader18._crit_edge_crit_edge, %.preheader18.thread, %._crit_edge57
  %53 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %54 = bitcast [2000 x [2000 x double]]** %8 to i8**
  store i8* %53, i8** %54, align 8
  %55 = bitcast i8* %53 to [2000 x [2000 x double]]*
  br i1 %10, label %.preheader15.lr.ph, label %.preheader14.thread

.preheader14.thread:                              ; preds = %.preheader18._crit_edge
  br label %.preheader11

.preheader15.lr.ph:                               ; preds = %.preheader18._crit_edge
  br i1 true, label %.preheader15.lr.ph..preheader15.us_crit_edge, label %.preheader15...preheader14_crit_edge_crit_edge

.preheader15.lr.ph..preheader15.us_crit_edge:     ; preds = %.preheader15.lr.ph
  %56 = add i32 %0, -1
  %57 = zext i32 %56 to i64
  %58 = shl nuw nsw i64 %57, 3
  %59 = add nuw nsw i64 %58, 8
  %60 = sext i32 %0 to i64
  %61 = add nsw i64 %60, -1
  %xtraiter199 = and i64 %60, 3
  %lcmp.mod200 = icmp eq i64 %xtraiter199, 0
  br i1 %lcmp.mod200, label %._crit_edge40.us.prol.loopexit, label %._crit_edge40.us.prol.preheader

._crit_edge40.us.prol.preheader:                  ; preds = %.preheader15.lr.ph..preheader15.us_crit_edge
  br label %._crit_edge40.us.prol

._crit_edge40.us.prol:                            ; preds = %._crit_edge40.us.prol, %._crit_edge40.us.prol.preheader
  %indvars.iv111.prol = phi i64 [ %indvars.iv.next112.prol, %._crit_edge40.us.prol ], [ 0, %._crit_edge40.us.prol.preheader ]
  %indvar.prol = phi i64 [ %indvar.next.prol, %._crit_edge40.us.prol ], [ 0, %._crit_edge40.us.prol.preheader ]
  %prol.iter201 = phi i64 [ %prol.iter201.sub, %._crit_edge40.us.prol ], [ %xtraiter199, %._crit_edge40.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvar.prol, i64 0
  %scevgep110.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep110.prol, i8 0, i64 %59, i32 8, i1 false)
  %indvars.iv.next112.prol = add i64 %indvars.iv111.prol, 1
  %indvar.next.prol = add i64 %indvar.prol, 1
  %prol.iter201.sub = add i64 %prol.iter201, -1
  %prol.iter201.cmp = icmp eq i64 %prol.iter201.sub, 0
  br i1 %prol.iter201.cmp, label %._crit_edge40.us.prol.loopexit.unr-lcssa, label %._crit_edge40.us.prol, !llvm.loop !1

._crit_edge40.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge40.us.prol
  br label %._crit_edge40.us.prol.loopexit

._crit_edge40.us.prol.loopexit:                   ; preds = %.preheader15.lr.ph..preheader15.us_crit_edge, %._crit_edge40.us.prol.loopexit.unr-lcssa
  %indvars.iv111.unr = phi i64 [ 0, %.preheader15.lr.ph..preheader15.us_crit_edge ], [ %indvars.iv.next112.prol, %._crit_edge40.us.prol.loopexit.unr-lcssa ]
  %indvar.unr = phi i64 [ 0, %.preheader15.lr.ph..preheader15.us_crit_edge ], [ %indvar.next.prol, %._crit_edge40.us.prol.loopexit.unr-lcssa ]
  %62 = icmp ult i64 %61, 3
  br i1 %62, label %._crit_edge40.us...preheader14_crit_edge_crit_edge, label %.preheader15.lr.ph..preheader15.us_crit_edge.new

.preheader15.lr.ph..preheader15.us_crit_edge.new: ; preds = %._crit_edge40.us.prol.loopexit
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us, %.preheader15.lr.ph..preheader15.us_crit_edge.new
  %indvars.iv111 = phi i64 [ %indvars.iv111.unr, %.preheader15.lr.ph..preheader15.us_crit_edge.new ], [ %indvars.iv.next112.3, %._crit_edge40.us ]
  %indvar = phi i64 [ %indvar.unr, %.preheader15.lr.ph..preheader15.us_crit_edge.new ], [ %indvar.next.3, %._crit_edge40.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvar, i64 0
  %scevgep110 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep110, i8 0, i64 %59, i32 8, i1 false)
  %indvar.next = add i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvar.next, i64 0
  %scevgep110.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep110.1, i8 0, i64 %59, i32 8, i1 false)
  %indvar.next.1 = add i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvar.next.1, i64 0
  %scevgep110.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep110.2, i8 0, i64 %59, i32 8, i1 false)
  %indvar.next.2 = add i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvar.next.2, i64 0
  %scevgep110.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep110.3, i8 0, i64 %59, i32 8, i1 false)
  %indvars.iv.next112.3 = add i64 %indvars.iv111, 4
  %63 = icmp slt i64 %indvars.iv.next112.3, %60
  %indvar.next.3 = add i64 %indvar, 4
  br i1 %63, label %._crit_edge40.us, label %._crit_edge40.us...preheader14_crit_edge_crit_edge.unr-lcssa

._crit_edge40.us...preheader14_crit_edge_crit_edge.unr-lcssa: ; preds = %._crit_edge40.us
  br label %._crit_edge40.us...preheader14_crit_edge_crit_edge

._crit_edge40.us...preheader14_crit_edge_crit_edge: ; preds = %._crit_edge40.us.prol.loopexit, %._crit_edge40.us...preheader14_crit_edge_crit_edge.unr-lcssa
  %.pr140.pre = load i32, i32* %6, align 4
  br label %.preheader14

.preheader15...preheader14_crit_edge_crit_edge:   ; preds = %.preheader15.lr.ph
  br label %.preheader14

.preheader14:                                     ; preds = %._crit_edge40.us...preheader14_crit_edge_crit_edge, %.preheader15...preheader14_crit_edge_crit_edge
  %64 = phi i32 [ %.pr140.pre, %._crit_edge40.us...preheader14_crit_edge_crit_edge ], [ %0, %.preheader15...preheader14_crit_edge_crit_edge ]
  %65 = icmp sgt i32 %64, 0
  br i1 %65, label %.preheader13.lr.ph, label %.preheader11.thread

.preheader11.thread:                              ; preds = %.preheader14
  %.pre = load i8*, i8** %54, align 8
  br label %.preheader11._crit_edge

.preheader13.lr.ph:                               ; preds = %.preheader14
  %66 = load [2000 x double]*, [2000 x double]** %7, align 8
  %67 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %68 = bitcast [2000 x [2000 x double]]* %67 to i8*
  br i1 true, label %.preheader13.lr.ph..preheader13.us_crit_edge, label %.preheader13...preheader11_crit_edge_crit_edge

.preheader13.lr.ph..preheader13.us_crit_edge:     ; preds = %.preheader13.lr.ph
  %69 = add i32 %64, -1
  %70 = sext i32 %64 to i64
  %wide.trip.count101 = zext i32 %69 to i64
  %71 = add nuw nsw i64 %wide.trip.count101, 1
  %72 = add nuw nsw i64 %wide.trip.count101, 1
  %min.iters.check = icmp ult i64 %71, 4
  %n.vec = and i64 %71, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %71, %n.vec
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %._crit_edge28.us, %.preheader13.lr.ph..preheader13.us_crit_edge
  %indvar146 = phi i64 [ %73, %._crit_edge28.us ], [ 0, %.preheader13.lr.ph..preheader13.us_crit_edge ]
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %._crit_edge28.us ], [ 0, %.preheader13.lr.ph..preheader13.us_crit_edge ]
  %scevgep148 = getelementptr [2000 x double], [2000 x double]* %66, i64 0, i64 %indvar146
  %73 = add i64 %indvar146, 1
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %66, i64 %wide.trip.count101, i64 %73
  br i1 true, label %.preheader12.us.us.preheader, label %.preheader13.us.._crit_edge28.us_crit_edge

.preheader13.us.._crit_edge28.us_crit_edge:       ; preds = %.preheader13.us
  br label %._crit_edge28.us

.preheader12.us.us.preheader:                     ; preds = %.preheader13.us
  br label %.preheader12.us.us

._crit_edge28.us:                                 ; preds = %.preheader13.us.._crit_edge28.us_crit_edge, %._crit_edge26.us.us.._crit_edge28.us_crit_edge
  %indvars.iv.next106 = add i64 %indvars.iv105, 1
  %74 = icmp slt i64 %indvars.iv.next106, %70
  br i1 %74, label %.preheader13.us, label %._crit_edge28.us...preheader11_crit_edge_crit_edge

._crit_edge28.us...preheader11_crit_edge_crit_edge: ; preds = %._crit_edge28.us
  br label %..preheader11_crit_edge

.preheader12.us.us:                               ; preds = %.preheader12.us.us.preheader, %._crit_edge26.us.us
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge26.us.us ], [ 0, %.preheader12.us.us.preheader ]
  %scevgep142 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv103, i64 0
  %scevgep144 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv103, i64 %71
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %indvars.iv103, i64 %indvars.iv105
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader12.us.us
  %indvars.iv99.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader12.us.us ], [ %n.vec, %middle.block ]
  %76 = sub nsw i64 %72, %indvars.iv99.ph
  %xtraiter197 = and i64 %76, 1
  %lcmp.mod198 = icmp eq i64 %xtraiter197, 0
  br i1 %lcmp.mod198, label %scalar.ph.prol.loopexit.unr-lcssa, label %scalar.ph.prol.preheader

scalar.ph.prol.preheader:                         ; preds = %scalar.ph.preheader
  br label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.prol.preheader
  %77 = load double, double* %75, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %indvars.iv99.ph, i64 %indvars.iv105
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv103, i64 %indvars.iv99.ph
  %82 = load double, double* %81, align 8
  %83 = fadd double %80, %82
  store double %83, double* %81, align 8
  %indvars.iv.next100.prol = or i64 %indvars.iv99.ph, 1
  br label %scalar.ph.prol.loopexit.unr-lcssa

scalar.ph.prol.loopexit.unr-lcssa:                ; preds = %scalar.ph.preheader, %scalar.ph.prol
  %indvars.iv99.unr.ph = phi i64 [ %indvars.iv.next100.prol, %scalar.ph.prol ], [ %indvars.iv99.ph, %scalar.ph.preheader ]
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol.loopexit.unr-lcssa
  %84 = icmp eq i64 %wide.trip.count101, %indvars.iv99.ph
  br i1 %84, label %._crit_edge26.us.us.loopexit, label %scalar.ph.preheader.new

scalar.ph.preheader.new:                          ; preds = %scalar.ph.prol.loopexit
  br label %scalar.ph

min.iters.checked:                                ; preds = %.preheader12.us.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep142, %scevgep150
  %bound1 = icmp ult double* %scevgep148, %scevgep144
  %found.conflict = and i1 %bound0, %bound1
  %bound0153 = icmp ult double* %scevgep142, %75
  %bound1154 = icmp ult double* %75, %scevgep144
  %found.conflict155 = and i1 %bound0153, %bound1154
  %conflict.rdx = or i1 %found.conflict, %found.conflict155
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %85 = or i64 %index, 1
  %86 = or i64 %index, 2
  %87 = or i64 %index, 3
  %88 = load double, double* %75, align 8, !alias.scope !3
  %89 = insertelement <2 x double> undef, double %88, i32 0
  %90 = shufflevector <2 x double> %89, <2 x double> undef, <2 x i32> zeroinitializer
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %index, i64 %indvars.iv105
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %85, i64 %indvars.iv105
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %86, i64 %indvars.iv105
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %87, i64 %indvars.iv105
  %95 = load double, double* %91, align 8, !alias.scope !6
  %96 = load double, double* %92, align 8, !alias.scope !6
  %97 = load double, double* %93, align 8, !alias.scope !6
  %98 = load double, double* %94, align 8, !alias.scope !6
  %99 = insertelement <2 x double> undef, double %95, i32 0
  %100 = insertelement <2 x double> %99, double %96, i32 1
  %101 = insertelement <2 x double> undef, double %97, i32 0
  %102 = insertelement <2 x double> %101, double %98, i32 1
  %103 = fmul <2 x double> %90, %100
  %104 = fmul <2 x double> %90, %102
  %105 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv103, i64 %index
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !8, !noalias !10
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %108, align 8, !alias.scope !8, !noalias !10
  %109 = fadd <2 x double> %103, %wide.load
  %110 = fadd <2 x double> %104, %wide.load157
  store <2 x double> %109, <2 x double>* %106, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %110, <2 x double>* %108, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %111 = icmp eq i64 %index.next, %n.vec
  br i1 %111, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge26.us.us, label %scalar.ph.preheader

._crit_edge26.us.us.loopexit.unr-lcssa:           ; preds = %scalar.ph
  br label %._crit_edge26.us.us.loopexit

._crit_edge26.us.us.loopexit:                     ; preds = %scalar.ph.prol.loopexit, %._crit_edge26.us.us.loopexit.unr-lcssa
  br label %._crit_edge26.us.us

._crit_edge26.us.us:                              ; preds = %._crit_edge26.us.us.loopexit, %middle.block
  %indvars.iv.next104 = add nuw i64 %indvars.iv103, 1
  %112 = icmp slt i64 %indvars.iv.next104, %70
  br i1 %112, label %.preheader12.us.us, label %._crit_edge26.us.us.._crit_edge28.us_crit_edge

._crit_edge26.us.us.._crit_edge28.us_crit_edge:   ; preds = %._crit_edge26.us.us
  br label %._crit_edge28.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader.new
  %indvars.iv99 = phi i64 [ %indvars.iv99.unr.ph, %scalar.ph.preheader.new ], [ %indvars.iv.next100.1, %scalar.ph ]
  %113 = load double, double* %75, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %indvars.iv99, i64 %indvars.iv105
  %115 = load double, double* %114, align 8
  %116 = fmul double %113, %115
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv103, i64 %indvars.iv99
  %118 = load double, double* %117, align 8
  %119 = fadd double %116, %118
  store double %119, double* %117, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %120 = load double, double* %75, align 8
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %indvars.iv.next100, i64 %indvars.iv105
  %122 = load double, double* %121, align 8
  %123 = fmul double %120, %122
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next100
  %125 = load double, double* %124, align 8
  %126 = fadd double %123, %125
  store double %126, double* %124, align 8
  %exitcond102.1 = icmp eq i64 %indvars.iv.next100, %wide.trip.count101
  %indvars.iv.next100.1 = add nsw i64 %indvars.iv99, 2
  br i1 %exitcond102.1, label %._crit_edge26.us.us.loopexit.unr-lcssa, label %scalar.ph, !llvm.loop !14

.preheader13...preheader11_crit_edge_crit_edge:   ; preds = %.preheader13.lr.ph
  br label %..preheader11_crit_edge

..preheader11_crit_edge:                          ; preds = %.preheader13...preheader11_crit_edge_crit_edge, %._crit_edge28.us...preheader11_crit_edge_crit_edge
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader14.thread, %..preheader11_crit_edge
  %127 = phi i8* [ %53, %.preheader14.thread ], [ %68, %..preheader11_crit_edge ]
  %128 = phi [2000 x double]* [ %1, %.preheader14.thread ], [ %66, %..preheader11_crit_edge ]
  %129 = phi [2000 x [2000 x double]]* [ %55, %.preheader14.thread ], [ %67, %..preheader11_crit_edge ]
  %130 = phi i32 [ %0, %.preheader14.thread ], [ %64, %..preheader11_crit_edge ]
  %131 = icmp sgt i32 %130, 0
  br i1 %131, label %.preheader.lr.ph, label %.preheader11._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader11
  br i1 true, label %.preheader.lr.ph..preheader.us_crit_edge, label %.preheader.._crit_edge20_crit_edge

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %.preheader.lr.ph
  %132 = add i32 %130, -1
  %133 = sext i32 %130 to i64
  %wide.trip.count95 = zext i32 %132 to i64
  %134 = add nuw nsw i64 %wide.trip.count95, 1
  %135 = and i64 %134, 8589934588
  %136 = add nsw i64 %135, -4
  %137 = lshr exact i64 %136, 2
  %138 = add nuw nsw i64 %wide.trip.count95, 1
  %min.iters.check161 = icmp ult i64 %134, 4
  %n.vec164 = and i64 %134, 8589934588
  %cmp.zero165 = icmp eq i64 %n.vec164, 0
  %139 = and i64 %137, 1
  %lcmp.mod = icmp eq i64 %139, 0
  %140 = icmp eq i64 %137, 0
  %cmp.n186 = icmp eq i64 %134, %n.vec164
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvar167 = phi i64 [ %indvar.next168, %._crit_edge.us ], [ 0, %.preheader.lr.ph..preheader.us_crit_edge ]
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge.us ], [ 0, %.preheader.lr.ph..preheader.us_crit_edge ]
  %scevgep169 = getelementptr [2000 x double], [2000 x double]* %128, i64 %indvar167, i64 0
  %scevgep171 = getelementptr [2000 x double], [2000 x double]* %128, i64 %indvar167, i64 %134
  %scevgep173 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvar167, i64 0
  %scevgep175 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvar167, i64 %134
  br i1 %min.iters.check161, label %scalar.ph160.preheader, label %min.iters.checked162

min.iters.checked162:                             ; preds = %.preheader.us
  br i1 %cmp.zero165, label %scalar.ph160.preheader, label %vector.memcheck181

vector.memcheck181:                               ; preds = %min.iters.checked162
  %bound0177 = icmp ult double* %scevgep169, %scevgep175
  %bound1178 = icmp ult double* %scevgep173, %scevgep171
  %memcheck.conflict180 = and i1 %bound0177, %bound1178
  br i1 %memcheck.conflict180, label %scalar.ph160.preheader, label %vector.body158.preheader

vector.body158.preheader:                         ; preds = %vector.memcheck181
  br i1 %lcmp.mod, label %vector.body158.prol.preheader, label %vector.body158.prol.loopexit.unr-lcssa

vector.body158.prol.preheader:                    ; preds = %vector.body158.preheader
  br label %vector.body158.prol

vector.body158.prol:                              ; preds = %vector.body158.prol.preheader
  %141 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv97, i64 0
  %142 = bitcast double* %141 to <2 x i64>*
  %wide.load191.prol = load <2 x i64>, <2 x i64>* %142, align 8, !alias.scope !15
  %143 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv97, i64 2
  %144 = bitcast double* %143 to <2 x i64>*
  %wide.load192.prol = load <2 x i64>, <2 x i64>* %144, align 8, !alias.scope !15
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv97, i64 0
  %146 = bitcast double* %145 to <2 x i64>*
  store <2 x i64> %wide.load191.prol, <2 x i64>* %146, align 8, !alias.scope !18, !noalias !15
  %147 = getelementptr [2000 x double], [2000 x double]* %128, i64 %indvars.iv97, i64 2
  %148 = bitcast double* %147 to <2 x i64>*
  store <2 x i64> %wide.load192.prol, <2 x i64>* %148, align 8, !alias.scope !18, !noalias !15
  br label %vector.body158.prol.loopexit.unr-lcssa

vector.body158.prol.loopexit.unr-lcssa:           ; preds = %vector.body158.preheader, %vector.body158.prol
  %index183.unr.ph = phi i64 [ 4, %vector.body158.prol ], [ 0, %vector.body158.preheader ]
  br label %vector.body158.prol.loopexit

vector.body158.prol.loopexit:                     ; preds = %vector.body158.prol.loopexit.unr-lcssa
  br i1 %140, label %middle.block159, label %vector.body158.preheader.new

vector.body158.preheader.new:                     ; preds = %vector.body158.prol.loopexit
  br label %vector.body158

vector.body158:                                   ; preds = %vector.body158, %vector.body158.preheader.new
  %index183 = phi i64 [ %index183.unr.ph, %vector.body158.preheader.new ], [ %index.next184.1, %vector.body158 ]
  %149 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv97, i64 %index183
  %150 = bitcast double* %149 to <2 x i64>*
  %wide.load191 = load <2 x i64>, <2 x i64>* %150, align 8, !alias.scope !15
  %151 = getelementptr double, double* %149, i64 2
  %152 = bitcast double* %151 to <2 x i64>*
  %wide.load192 = load <2 x i64>, <2 x i64>* %152, align 8, !alias.scope !15
  %153 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv97, i64 %index183
  %154 = bitcast double* %153 to <2 x i64>*
  store <2 x i64> %wide.load191, <2 x i64>* %154, align 8, !alias.scope !18, !noalias !15
  %155 = getelementptr double, double* %153, i64 2
  %156 = bitcast double* %155 to <2 x i64>*
  store <2 x i64> %wide.load192, <2 x i64>* %156, align 8, !alias.scope !18, !noalias !15
  %index.next184 = add i64 %index183, 4
  %157 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv97, i64 %index.next184
  %158 = bitcast double* %157 to <2 x i64>*
  %wide.load191.1 = load <2 x i64>, <2 x i64>* %158, align 8, !alias.scope !15
  %159 = getelementptr double, double* %157, i64 2
  %160 = bitcast double* %159 to <2 x i64>*
  %wide.load192.1 = load <2 x i64>, <2 x i64>* %160, align 8, !alias.scope !15
  %161 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv97, i64 %index.next184
  %162 = bitcast double* %161 to <2 x i64>*
  store <2 x i64> %wide.load191.1, <2 x i64>* %162, align 8, !alias.scope !18, !noalias !15
  %163 = getelementptr double, double* %161, i64 2
  %164 = bitcast double* %163 to <2 x i64>*
  store <2 x i64> %wide.load192.1, <2 x i64>* %164, align 8, !alias.scope !18, !noalias !15
  %index.next184.1 = add i64 %index183, 8
  %165 = icmp eq i64 %index.next184.1, %n.vec164
  br i1 %165, label %middle.block159.unr-lcssa, label %vector.body158, !llvm.loop !20

middle.block159.unr-lcssa:                        ; preds = %vector.body158
  br label %middle.block159

middle.block159:                                  ; preds = %vector.body158.prol.loopexit, %middle.block159.unr-lcssa
  br i1 %cmp.n186, label %._crit_edge.us, label %scalar.ph160.preheader

scalar.ph160.preheader:                           ; preds = %middle.block159, %vector.memcheck181, %min.iters.checked162, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck181 ], [ 0, %min.iters.checked162 ], [ 0, %.preheader.us ], [ %n.vec164, %middle.block159 ]
  %166 = sub nsw i64 %138, %indvars.iv.ph
  %167 = sub nsw i64 %wide.trip.count95, %indvars.iv.ph
  %xtraiter195 = and i64 %166, 3
  %lcmp.mod196 = icmp eq i64 %xtraiter195, 0
  br i1 %lcmp.mod196, label %scalar.ph160.prol.loopexit, label %scalar.ph160.prol.preheader

scalar.ph160.prol.preheader:                      ; preds = %scalar.ph160.preheader
  br label %scalar.ph160.prol

scalar.ph160.prol:                                ; preds = %scalar.ph160.prol, %scalar.ph160.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph160.prol ], [ %indvars.iv.ph, %scalar.ph160.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph160.prol ], [ %xtraiter195, %scalar.ph160.prol.preheader ]
  %168 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv97, i64 %indvars.iv.prol
  %169 = bitcast double* %168 to i64*
  %170 = load i64, i64* %169, align 8
  %171 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv97, i64 %indvars.iv.prol
  %172 = bitcast double* %171 to i64*
  store i64 %170, i64* %172, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph160.prol.loopexit.unr-lcssa, label %scalar.ph160.prol, !llvm.loop !21

scalar.ph160.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph160.prol
  br label %scalar.ph160.prol.loopexit

scalar.ph160.prol.loopexit:                       ; preds = %scalar.ph160.preheader, %scalar.ph160.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph160.preheader ], [ %indvars.iv.next.prol, %scalar.ph160.prol.loopexit.unr-lcssa ]
  %173 = icmp ult i64 %167, 3
  br i1 %173, label %._crit_edge.us.loopexit, label %scalar.ph160.preheader.new

scalar.ph160.preheader.new:                       ; preds = %scalar.ph160.prol.loopexit
  br label %scalar.ph160

scalar.ph160:                                     ; preds = %scalar.ph160, %scalar.ph160.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %scalar.ph160.preheader.new ], [ %indvars.iv.next.3, %scalar.ph160 ]
  %174 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv97, i64 %indvars.iv
  %175 = bitcast double* %174 to i64*
  %176 = load i64, i64* %175, align 8
  %177 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv97, i64 %indvars.iv
  %178 = bitcast double* %177 to i64*
  store i64 %176, i64* %178, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %179 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next
  %180 = bitcast double* %179 to i64*
  %181 = load i64, i64* %180, align 8
  %182 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv97, i64 %indvars.iv.next
  %183 = bitcast double* %182 to i64*
  store i64 %181, i64* %183, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %184 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.1
  %185 = bitcast double* %184 to i64*
  %186 = load i64, i64* %185, align 8
  %187 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv97, i64 %indvars.iv.next.1
  %188 = bitcast double* %187 to i64*
  store i64 %186, i64* %188, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %189 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.2
  %190 = bitcast double* %189 to i64*
  %191 = load i64, i64* %190, align 8
  %192 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv97, i64 %indvars.iv.next.2
  %193 = bitcast double* %192 to i64*
  store i64 %191, i64* %193, align 8
  %exitcond96.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count95
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond96.3, label %._crit_edge.us.loopexit.unr-lcssa, label %scalar.ph160, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %scalar.ph160
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %scalar.ph160.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block159
  %indvars.iv.next98 = add i64 %indvars.iv97, 1
  %194 = icmp slt i64 %indvars.iv.next98, %133
  %indvar.next168 = add i64 %indvar167, 1
  br i1 %194, label %.preheader.us, label %._crit_edge.us.._crit_edge20_crit_edge

._crit_edge.us.._crit_edge20_crit_edge:           ; preds = %._crit_edge.us
  br label %._crit_edge20

.preheader.._crit_edge20_crit_edge:               ; preds = %.preheader.lr.ph
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %.preheader.._crit_edge20_crit_edge, %._crit_edge.us.._crit_edge20_crit_edge
  br label %.preheader11._crit_edge

.preheader11._crit_edge:                          ; preds = %.preheader11, %.preheader11.thread, %._crit_edge20
  %195 = phi i8* [ %127, %.preheader11 ], [ %.pre, %.preheader11.thread ], [ %127, %._crit_edge20 ]
  tail call void @free(i8* %195) #4
  ret void
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
  %9 = add nsw i64 %wide.trip.count130, 1
  br label %.preheader11

.preheader11:                                     ; preds = %._crit_edge65, %.preheader11.lr.ph
  %indvars.iv147 = phi i64 [ %indvars.iv.next148, %._crit_edge65 ], [ 0, %.preheader11.lr.ph ]
  %indvars.iv139 = phi i32 [ %14, %._crit_edge65 ], [ -1, %.preheader11.lr.ph ]
  %10 = add i64 %indvars.iv147, 4294967295
  %11 = and i64 %10, 4294967295
  %12 = sub i64 %9, %indvars.iv147
  %13 = sub i64 %wide.trip.count130, %indvars.iv147
  %14 = add i32 %indvars.iv139, 1
  %15 = icmp sgt i64 %indvars.iv147, 0
  br i1 %15, label %.lr.ph49.preheader, label %.preheader10

.lr.ph49.preheader:                               ; preds = %.preheader11
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 0
  br label %.lr.ph49

..preheader9_crit_edge:                           ; preds = %._crit_edge65
  br label %.preheader9

.preheader9:                                      ; preds = %5, %..preheader9_crit_edge
  br i1 %6, label %.lr.ph34, label %.preheader.thread

.preheader.thread:                                ; preds = %.preheader9
  br label %.preheader._crit_edge

.lr.ph34:                                         ; preds = %.preheader9
  %17 = sext i32 %0 to i64
  br label %83

.preheader10.loopexit:                            ; preds = %._crit_edge80
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11
  %18 = icmp slt i64 %indvars.iv147, %8
  br i1 %18, label %.lr.ph64, label %._crit_edge65

.lr.ph64:                                         ; preds = %.preheader10
  br i1 %15, label %.lr.ph64.split.us.preheader, label %.lr.ph64.split.preheader

.lr.ph64.split.preheader:                         ; preds = %.lr.ph64
  %xtraiter179 = and i64 %12, 3
  %lcmp.mod180 = icmp eq i64 %xtraiter179, 0
  br i1 %lcmp.mod180, label %.lr.ph64.split.prol.loopexit, label %.lr.ph64.split.prol.preheader

.lr.ph64.split.prol.preheader:                    ; preds = %.lr.ph64.split.preheader
  br label %.lr.ph64.split.prol

.lr.ph64.split.prol:                              ; preds = %.lr.ph64.split.prol, %.lr.ph64.split.prol.preheader
  %indvars.iv128.prol = phi i64 [ %indvars.iv.next129.prol, %.lr.ph64.split.prol ], [ %indvars.iv147, %.lr.ph64.split.prol.preheader ]
  %prol.iter181 = phi i64 [ %prol.iter181.sub, %.lr.ph64.split.prol ], [ %xtraiter179, %.lr.ph64.split.prol.preheader ]
  %indvars.iv.next129.prol = add i64 %indvars.iv128.prol, 1
  %prol.iter181.sub = add i64 %prol.iter181, -1
  %prol.iter181.cmp = icmp eq i64 %prol.iter181.sub, 0
  br i1 %prol.iter181.cmp, label %.lr.ph64.split.prol.loopexit.unr-lcssa, label %.lr.ph64.split.prol, !llvm.loop !23

.lr.ph64.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph64.split.prol
  br label %.lr.ph64.split.prol.loopexit

.lr.ph64.split.prol.loopexit:                     ; preds = %.lr.ph64.split.preheader, %.lr.ph64.split.prol.loopexit.unr-lcssa
  %indvars.iv128.unr = phi i64 [ %indvars.iv147, %.lr.ph64.split.preheader ], [ %indvars.iv.next129.prol, %.lr.ph64.split.prol.loopexit.unr-lcssa ]
  %19 = icmp ult i64 %13, 3
  br i1 %19, label %._crit_edge65.loopexit149, label %.lr.ph64.split.preheader.new

.lr.ph64.split.preheader.new:                     ; preds = %.lr.ph64.split.prol.loopexit
  br label %.lr.ph64.split

.lr.ph64.split.us.preheader:                      ; preds = %.lr.ph64
  %wide.trip.count141 = zext i32 %indvars.iv139 to i64
  %20 = and i64 %10, 1
  %lcmp.mod185 = icmp eq i64 %20, 0
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 0
  %22 = icmp eq i64 %11, 0
  br label %.lr.ph64.split.us

.lr.ph64.split.us:                                ; preds = %.lr.ph64.split.us.preheader, %._crit_edge57.us
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %._crit_edge57.us ], [ %indvars.iv147, %.lr.ph64.split.us.preheader ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv145
  %24 = load double, double* %23, align 8
  br i1 %lcmp.mod185, label %.prol.preheader182, label %.prol.loopexit183.unr-lcssa

.prol.preheader182:                               ; preds = %.lr.ph64.split.us
  br label %25

; <label>:25:                                     ; preds = %.prol.preheader182
  %26 = load double, double* %21, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv145
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %24, %29
  br label %.prol.loopexit183.unr-lcssa

.prol.loopexit183.unr-lcssa:                      ; preds = %.lr.ph64.split.us, %25
  %.lcssa167.unr.ph = phi double [ %30, %25 ], [ undef, %.lr.ph64.split.us ]
  %indvars.iv133.unr.ph = phi i64 [ 1, %25 ], [ 0, %.lr.ph64.split.us ]
  %.unr186.ph = phi double [ %30, %25 ], [ %24, %.lr.ph64.split.us ]
  br label %.prol.loopexit183

.prol.loopexit183:                                ; preds = %.prol.loopexit183.unr-lcssa
  br i1 %22, label %._crit_edge57.us, label %.lr.ph64.split.us.new

.lr.ph64.split.us.new:                            ; preds = %.prol.loopexit183
  br label %31

; <label>:31:                                     ; preds = %31, %.lr.ph64.split.us.new
  %indvars.iv133 = phi i64 [ %indvars.iv133.unr.ph, %.lr.ph64.split.us.new ], [ %indvars.iv.next134.1, %31 ]
  %32 = phi double [ %.unr186.ph, %.lr.ph64.split.us.new ], [ %44, %31 ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv133
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv133, i64 %indvars.iv145
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %32, %37
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv.next134
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next134, i64 %indvars.iv145
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  %exitcond142.1 = icmp eq i64 %indvars.iv.next134, %wide.trip.count141
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  br i1 %exitcond142.1, label %._crit_edge57.us.unr-lcssa, label %31

._crit_edge57.us.unr-lcssa:                       ; preds = %31
  br label %._crit_edge57.us

._crit_edge57.us:                                 ; preds = %.prol.loopexit183, %._crit_edge57.us.unr-lcssa
  %.lcssa167 = phi double [ %.lcssa167.unr.ph, %.prol.loopexit183 ], [ %44, %._crit_edge57.us.unr-lcssa ]
  store double %.lcssa167, double* %23, align 8
  %indvars.iv.next146 = add i64 %indvars.iv145, 1
  %45 = icmp slt i64 %indvars.iv.next146, %8
  br i1 %45, label %.lr.ph64.split.us, label %._crit_edge65.loopexit

.lr.ph49:                                         ; preds = %.lr.ph49.preheader, %._crit_edge80
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %._crit_edge80 ], [ 0, %.lr.ph49.preheader ]
  %indvars.iv120 = phi i32 [ %48, %._crit_edge80 ], [ -1, %.lr.ph49.preheader ]
  %46 = add i64 %indvars.iv124, 4294967295
  %47 = and i64 %46, 4294967295
  %48 = add i32 %indvars.iv120, 1
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv124
  %50 = load double, double* %49, align 8
  %51 = icmp sgt i64 %indvars.iv124, 0
  br i1 %51, label %.lr.ph41, label %._crit_edge80

.lr.ph41:                                         ; preds = %.lr.ph49
  %wide.trip.count122 = zext i32 %indvars.iv120 to i64
  %52 = and i64 %46, 1
  %lcmp.mod177 = icmp eq i64 %52, 0
  br i1 %lcmp.mod177, label %.prol.preheader174, label %.prol.loopexit175.unr-lcssa

.prol.preheader174:                               ; preds = %.lr.ph41
  br label %53

; <label>:53:                                     ; preds = %.prol.preheader174
  %54 = load double, double* %16, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv124
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fsub double %50, %57
  br label %.prol.loopexit175.unr-lcssa

.prol.loopexit175.unr-lcssa:                      ; preds = %.lr.ph41, %53
  %.lcssa165.unr.ph = phi double [ %58, %53 ], [ undef, %.lr.ph41 ]
  %indvars.iv114.unr.ph = phi i64 [ 1, %53 ], [ 0, %.lr.ph41 ]
  %.unr178.ph = phi double [ %58, %53 ], [ %50, %.lr.ph41 ]
  br label %.prol.loopexit175

.prol.loopexit175:                                ; preds = %.prol.loopexit175.unr-lcssa
  %59 = icmp eq i64 %47, 0
  br i1 %59, label %._crit_edge42, label %.lr.ph41.new

.lr.ph41.new:                                     ; preds = %.prol.loopexit175
  br label %60

; <label>:60:                                     ; preds = %60, %.lr.ph41.new
  %indvars.iv114 = phi i64 [ %indvars.iv114.unr.ph, %.lr.ph41.new ], [ %indvars.iv.next115.1, %60 ]
  %61 = phi double [ %.unr178.ph, %.lr.ph41.new ], [ %73, %60 ]
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv114
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv124
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fsub double %61, %66
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv.next115
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next115, i64 %indvars.iv124
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fsub double %67, %72
  %exitcond123.1 = icmp eq i64 %indvars.iv.next115, %wide.trip.count122
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114, 2
  br i1 %exitcond123.1, label %._crit_edge42.unr-lcssa, label %60

._crit_edge42.unr-lcssa:                          ; preds = %60
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %.prol.loopexit175, %._crit_edge42.unr-lcssa
  %.lcssa165 = phi double [ %.lcssa165.unr.ph, %.prol.loopexit175 ], [ %73, %._crit_edge42.unr-lcssa ]
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %.lr.ph49, %._crit_edge42
  %74 = phi double [ %.lcssa165, %._crit_edge42 ], [ %50, %.lr.ph49 ]
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv124, i64 %indvars.iv124
  %76 = load double, double* %75, align 8
  %77 = fdiv double %74, %76
  store double %77, double* %49, align 8
  %indvars.iv.next125 = add nuw i64 %indvars.iv124, 1
  %78 = icmp slt i64 %indvars.iv.next125, %indvars.iv147
  br i1 %78, label %.lr.ph49, label %.preheader10.loopexit

.lr.ph64.split:                                   ; preds = %.lr.ph64.split, %.lr.ph64.split.preheader.new
  %indvars.iv128 = phi i64 [ %indvars.iv128.unr, %.lr.ph64.split.preheader.new ], [ %indvars.iv.next129.3, %.lr.ph64.split ]
  %indvars.iv.next129.2 = add i64 %indvars.iv128, 3
  %exitcond131.3 = icmp eq i64 %indvars.iv.next129.2, %wide.trip.count130
  %indvars.iv.next129.3 = add i64 %indvars.iv128, 4
  br i1 %exitcond131.3, label %._crit_edge65.loopexit149.unr-lcssa, label %.lr.ph64.split

._crit_edge65.loopexit149.unr-lcssa:              ; preds = %.lr.ph64.split
  br label %._crit_edge65.loopexit149

._crit_edge65.loopexit149:                        ; preds = %.lr.ph64.split.prol.loopexit, %._crit_edge65.loopexit149.unr-lcssa
  br label %._crit_edge65

._crit_edge65.loopexit:                           ; preds = %._crit_edge57.us
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.loopexit, %._crit_edge65.loopexit149, %.preheader10
  %indvars.iv.next148 = add i64 %indvars.iv147, 1
  %79 = icmp slt i64 %indvars.iv.next148, %8
  br i1 %79, label %.preheader11, label %..preheader9_crit_edge

.preheader:                                       ; preds = %._crit_edge83
  %80 = add i32 %0, -1
  br i1 true, label %.lr.ph20, label %.preheader..preheader._crit_edge_crit_edge

.preheader..preheader._crit_edge_crit_edge:       ; preds = %.preheader
  br label %.preheader._crit_edge

.lr.ph20:                                         ; preds = %.preheader
  %81 = sext i32 %80 to i64
  %82 = add nsw i64 %81, 1
  br label %132

; <label>:83:                                     ; preds = %._crit_edge83, %.lr.ph34
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge83 ], [ 0, %.lr.ph34 ]
  %indvars.iv108 = phi i32 [ %indvars.iv.next109, %._crit_edge83 ], [ -1, %.lr.ph34 ]
  %storemerge133 = phi i64 [ %indvars.iv.next113, %._crit_edge83 ], [ 0, %.lr.ph34 ]
  %84 = add i64 %indvars.iv112, 4294967295
  %85 = and i64 %84, 4294967295
  %sext = shl i64 %storemerge133, 32
  %86 = ashr exact i64 %sext, 32
  %87 = getelementptr inbounds double, double* %2, i64 %86
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = icmp sgt i64 %indvars.iv112, 0
  %91 = bitcast i64 %89 to double
  br i1 %90, label %.lr.ph27, label %._crit_edge83

.lr.ph27:                                         ; preds = %83
  %wide.trip.count110 = zext i32 %indvars.iv108 to i64
  %xtraiter170 = and i64 %indvars.iv112, 3
  %lcmp.mod171 = icmp eq i64 %xtraiter170, 0
  br i1 %lcmp.mod171, label %.prol.loopexit169, label %.prol.preheader168

.prol.preheader168:                               ; preds = %.lr.ph27
  br label %92

; <label>:92:                                     ; preds = %92, %.prol.preheader168
  %indvars.iv102.prol = phi i64 [ %indvars.iv.next103.prol, %92 ], [ 0, %.prol.preheader168 ]
  %93 = phi double [ %99, %92 ], [ %91, %.prol.preheader168 ]
  %prol.iter172 = phi i64 [ %prol.iter172.sub, %92 ], [ %xtraiter170, %.prol.preheader168 ]
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv102.prol
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds double, double* %4, i64 %indvars.iv102.prol
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fsub double %93, %98
  %indvars.iv.next103.prol = add nuw nsw i64 %indvars.iv102.prol, 1
  %prol.iter172.sub = add i64 %prol.iter172, -1
  %prol.iter172.cmp = icmp eq i64 %prol.iter172.sub, 0
  br i1 %prol.iter172.cmp, label %.prol.loopexit169.unr-lcssa, label %92, !llvm.loop !24

.prol.loopexit169.unr-lcssa:                      ; preds = %92
  br label %.prol.loopexit169

.prol.loopexit169:                                ; preds = %.lr.ph27, %.prol.loopexit169.unr-lcssa
  %.lcssa164.unr = phi double [ undef, %.lr.ph27 ], [ %99, %.prol.loopexit169.unr-lcssa ]
  %indvars.iv102.unr = phi i64 [ 0, %.lr.ph27 ], [ %indvars.iv.next103.prol, %.prol.loopexit169.unr-lcssa ]
  %.unr173 = phi double [ %91, %.lr.ph27 ], [ %99, %.prol.loopexit169.unr-lcssa ]
  %100 = icmp ult i64 %85, 3
  br i1 %100, label %._crit_edge28, label %.lr.ph27.new

.lr.ph27.new:                                     ; preds = %.prol.loopexit169
  br label %101

; <label>:101:                                    ; preds = %101, %.lr.ph27.new
  %indvars.iv102 = phi i64 [ %indvars.iv102.unr, %.lr.ph27.new ], [ %indvars.iv.next103.3, %101 ]
  %102 = phi double [ %.unr173, %.lr.ph27.new ], [ %126, %101 ]
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv102
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds double, double* %4, i64 %indvars.iv102
  %106 = load double, double* %105, align 8
  %107 = fmul double %104, %106
  %108 = fsub double %102, %107
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv.next103
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next103
  %112 = load double, double* %111, align 8
  %113 = fmul double %110, %112
  %114 = fsub double %108, %113
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv.next103.1
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next103.1
  %118 = load double, double* %117, align 8
  %119 = fmul double %116, %118
  %120 = fsub double %114, %119
  %indvars.iv.next103.2 = add nsw i64 %indvars.iv102, 3
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv.next103.2
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next103.2
  %124 = load double, double* %123, align 8
  %125 = fmul double %122, %124
  %126 = fsub double %120, %125
  %exitcond111.3 = icmp eq i64 %indvars.iv.next103.2, %wide.trip.count110
  %indvars.iv.next103.3 = add nsw i64 %indvars.iv102, 4
  br i1 %exitcond111.3, label %._crit_edge28.unr-lcssa, label %101

._crit_edge28.unr-lcssa:                          ; preds = %101
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %.prol.loopexit169, %._crit_edge28.unr-lcssa
  %.lcssa164 = phi double [ %.lcssa164.unr, %.prol.loopexit169 ], [ %126, %._crit_edge28.unr-lcssa ]
  %127 = bitcast double %.lcssa164 to i64
  br label %._crit_edge83

._crit_edge83:                                    ; preds = %83, %._crit_edge28
  %128 = phi i64 [ %89, %83 ], [ %127, %._crit_edge28 ]
  %129 = getelementptr inbounds double, double* %4, i64 %indvars.iv112
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next113 = add i64 %indvars.iv112, 1
  %131 = icmp slt i64 %indvars.iv.next113, %17
  %indvars.iv.next109 = add i32 %indvars.iv108, 1
  br i1 %131, label %83, label %.preheader

; <label>:132:                                    ; preds = %._crit_edge86, %.lr.ph20
  %indvar = phi i32 [ %indvar.next, %._crit_edge86 ], [ 0, %.lr.ph20 ]
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %._crit_edge86 ], [ %81, %.lr.ph20 ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge86 ], [ %0, %.lr.ph20 ]
  %133 = phi i32 [ %185, %._crit_edge86 ], [ %80, %.lr.ph20 ]
  %134 = sub i32 %0, %indvar
  %135 = sext i32 %134 to i64
  %136 = sub nsw i64 %81, %135
  %137 = sext i32 %133 to i64
  %138 = getelementptr inbounds double, double* %4, i64 %137
  %139 = load double, double* %138, align 8
  %140 = add nsw i64 %indvars.iv99, 1
  %141 = icmp slt i64 %140, %17
  br i1 %141, label %.lr.ph, label %._crit_edge86

.lr.ph:                                           ; preds = %132
  %142 = sub nsw i64 %82, %135
  %143 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %142, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %144

; <label>:144:                                    ; preds = %144, %.prol.preheader
  %indvars.iv97.prol = phi i64 [ %indvars.iv.next98.prol, %144 ], [ %143, %.prol.preheader ]
  %145 = phi double [ %151, %144 ], [ %139, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %144 ], [ %xtraiter, %.prol.preheader ]
  %146 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv97.prol
  %147 = load double, double* %146, align 8
  %148 = getelementptr inbounds double, double* %3, i64 %indvars.iv97.prol
  %149 = load double, double* %148, align 8
  %150 = fmul double %147, %149
  %151 = fsub double %145, %150
  %indvars.iv.next98.prol = add nsw i64 %indvars.iv97.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %144, !llvm.loop !25

.prol.loopexit.unr-lcssa:                         ; preds = %144
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %151, %.prol.loopexit.unr-lcssa ]
  %indvars.iv97.unr = phi i64 [ %143, %.lr.ph ], [ %indvars.iv.next98.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %139, %.lr.ph ], [ %151, %.prol.loopexit.unr-lcssa ]
  %152 = icmp ult i64 %136, 3
  br i1 %152, label %._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %153

; <label>:153:                                    ; preds = %153, %.lr.ph.new
  %indvars.iv97 = phi i64 [ %indvars.iv97.unr, %.lr.ph.new ], [ %indvars.iv.next98.3, %153 ]
  %154 = phi double [ %.unr, %.lr.ph.new ], [ %178, %153 ]
  %155 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv97
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds double, double* %3, i64 %indvars.iv97
  %158 = load double, double* %157, align 8
  %159 = fmul double %156, %158
  %160 = fsub double %154, %159
  %indvars.iv.next98 = add nsw i64 %indvars.iv97, 1
  %161 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv.next98
  %162 = load double, double* %161, align 8
  %163 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next98
  %164 = load double, double* %163, align 8
  %165 = fmul double %162, %164
  %166 = fsub double %160, %165
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  %167 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv.next98.1
  %168 = load double, double* %167, align 8
  %169 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next98.1
  %170 = load double, double* %169, align 8
  %171 = fmul double %168, %170
  %172 = fsub double %166, %171
  %indvars.iv.next98.2 = add nsw i64 %indvars.iv97, 3
  %173 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv.next98.2
  %174 = load double, double* %173, align 8
  %175 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next98.2
  %176 = load double, double* %175, align 8
  %177 = fmul double %174, %176
  %178 = fsub double %172, %177
  %exitcond.3 = icmp eq i64 %indvars.iv.next98.2, %81
  %indvars.iv.next98.3 = add nsw i64 %indvars.iv97, 4
  br i1 %exitcond.3, label %._crit_edge.unr-lcssa, label %153

._crit_edge.unr-lcssa:                            ; preds = %153
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit, %._crit_edge.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %178, %._crit_edge.unr-lcssa ]
  br label %._crit_edge86

._crit_edge86:                                    ; preds = %132, %._crit_edge
  %179 = phi double [ %139, %132 ], [ %.lcssa, %._crit_edge ]
  %180 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv99
  %181 = load double, double* %180, align 8
  %182 = fdiv double %179, %181
  %183 = getelementptr inbounds double, double* %3, i64 %indvars.iv99
  store double %182, double* %183, align 8
  %indvars.iv.next100 = add i64 %indvars.iv99, -1
  %184 = icmp sgt i64 %indvars.iv99, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %185 = trunc i64 %indvars.iv.next100 to i32
  %indvar.next = add i32 %indvar, 1
  br i1 %184, label %132, label %._crit_edge21

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
  br label %9

; <label>:9:                                      ; preds = %._crit_edge3, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge3 ], [ 0, %.lr.ph ]
  %storemerge1 = phi i32 [ %19, %._crit_edge3 ], [ 0, %.lr.ph ]
  %10 = srem i32 %storemerge1, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge3

; <label>:12:                                     ; preds = %9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %9, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  %19 = trunc i64 %indvars.iv.next to i32
  br i1 %18, label %9, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge3
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %2, %._crit_edge
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !2}
!24 = distinct !{!24, !2}
!25 = distinct !{!25, !2}
