; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = alloca [2000 x double]*, align 8
  %4 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %1, [2000 x double]** %3, align 8
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader15.lr.ph, label %._crit_edge66.thread

._crit_edge66.thread:                             ; preds = %2
  %6 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %7 = bitcast [2000 x [2000 x double]]** %4 to i8**
  store i8* %6, i8** %7, align 8
  br label %.preheader10._crit_edge

.preheader15.lr.ph:                               ; preds = %2
  %8 = sitofp i32 %0 to double
  %9 = add i32 %0, 7
  %10 = add i32 %0, -2
  %11 = sext i32 %0 to i64
  %wide.trip.count142.7 = zext i32 %0 to i64
  %wide.trip.count153 = zext i32 %0 to i64
  %12 = trunc i32 %9 to i3
  br label %.lr.ph54

.lr.ph54:                                         ; preds = %._crit_edge61, %.preheader15.lr.ph
  %indvars.iv161 = phi i3 [ %indvars.iv.next162, %._crit_edge61 ], [ %12, %.preheader15.lr.ph ]
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %._crit_edge61 ], [ 2, %.preheader15.lr.ph ]
  %indvars.iv151 = phi i64 [ %indvars.iv.next152, %._crit_edge61 ], [ 0, %.preheader15.lr.ph ]
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge61 ], [ 1, %.preheader15.lr.ph ]
  %13 = phi [2000 x double]* [ %.lcssa17, %._crit_edge61 ], [ %1, %.preheader15.lr.ph ]
  %14 = zext i3 %indvars.iv161 to i64
  %15 = add nuw nsw i64 %14, 4294967295
  %16 = and i64 %15, 4294967295
  %17 = add i64 %indvars.iv159, %16
  %18 = sub nsw i64 0, %indvars.iv151
  %19 = trunc i64 %18 to i32
  %20 = trunc i64 %18 to i32
  br label %21

; <label>:21:                                     ; preds = %21, %.lr.ph54
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %21 ], [ 0, %.lr.ph54 ]
  %22 = sub nsw i64 0, %indvars.iv132
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, %0
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %8
  %27 = fadd double %26, 1.000000e+00
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv151, i64 %indvars.iv132
  store double %27, double* %28, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond137 = icmp eq i64 %indvars.iv.next133, %indvars.iv149
  br i1 %exitcond137, label %._crit_edge55, label %21

._crit_edge55:                                    ; preds = %21
  %29 = add i32 %10, %20
  %.pre = load [2000 x double]*, [2000 x double]** %3, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %30 = icmp slt i64 %indvars.iv.next152, %11
  br i1 %30, label %.lr.ph60, label %._crit_edge61

.lr.ph60:                                         ; preds = %._crit_edge55
  %31 = add i32 %9, %19
  %32 = load [2000 x double]*, [2000 x double]** %3, align 8
  %xtraiter146 = and i32 %31, 7
  %lcmp.mod147 = icmp eq i32 %xtraiter146, 0
  br i1 %lcmp.mod147, label %.prol.loopexit145, label %.prol.preheader144.preheader

.prol.preheader144.preheader:                     ; preds = %.lr.ph60
  br label %.prol.preheader144

.prol.preheader144:                               ; preds = %.prol.preheader144.preheader, %.prol.preheader144
  %indvars.iv140.prol = phi i64 [ %indvars.iv.next141.prol, %.prol.preheader144 ], [ %indvars.iv149, %.prol.preheader144.preheader ]
  %33 = phi [2000 x double]* [ %32, %.prol.preheader144 ], [ %.pre, %.prol.preheader144.preheader ]
  %prol.iter148 = phi i32 [ %prol.iter148.sub, %.prol.preheader144 ], [ %xtraiter146, %.prol.preheader144.preheader ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %indvars.iv151, i64 %indvars.iv140.prol
  store double 0.000000e+00, double* %34, align 8
  %indvars.iv.next141.prol = add nuw nsw i64 %indvars.iv140.prol, 1
  %prol.iter148.sub = add nsw i32 %prol.iter148, -1
  %prol.iter148.cmp = icmp eq i32 %prol.iter148.sub, 0
  br i1 %prol.iter148.cmp, label %.prol.loopexit145.loopexit, label %.prol.preheader144, !llvm.loop !1

.prol.loopexit145.loopexit:                       ; preds = %.prol.preheader144
  br label %.prol.loopexit145

.prol.loopexit145:                                ; preds = %.prol.loopexit145.loopexit, %.lr.ph60
  %indvars.iv140.unr = phi i64 [ %indvars.iv149, %.lr.ph60 ], [ %17, %.prol.loopexit145.loopexit ]
  %.unr = phi [2000 x double]* [ %.pre, %.lr.ph60 ], [ %32, %.prol.loopexit145.loopexit ]
  %35 = icmp ult i32 %29, 7
  br i1 %35, label %._crit_edge61, label %.lr.ph60.new.preheader

.lr.ph60.new.preheader:                           ; preds = %.prol.loopexit145
  br label %.lr.ph60.new

.lr.ph60.new:                                     ; preds = %.lr.ph60.new.preheader, %.lr.ph60.new
  %indvars.iv140 = phi i64 [ %indvars.iv.next141.7, %.lr.ph60.new ], [ %indvars.iv140.unr, %.lr.ph60.new.preheader ]
  %36 = phi [2000 x double]* [ %32, %.lr.ph60.new ], [ %.unr, %.lr.ph60.new.preheader ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %36, i64 %indvars.iv151, i64 %indvars.iv140
  store double 0.000000e+00, double* %37, align 8
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv151, i64 %indvars.iv.next141
  store double 0.000000e+00, double* %38, align 8
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv151, i64 %indvars.iv.next141.1
  store double 0.000000e+00, double* %39, align 8
  %indvars.iv.next141.2 = add nsw i64 %indvars.iv140, 3
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv151, i64 %indvars.iv.next141.2
  store double 0.000000e+00, double* %40, align 8
  %indvars.iv.next141.3 = add nsw i64 %indvars.iv140, 4
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv151, i64 %indvars.iv.next141.3
  store double 0.000000e+00, double* %41, align 8
  %indvars.iv.next141.4 = add nsw i64 %indvars.iv140, 5
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv151, i64 %indvars.iv.next141.4
  store double 0.000000e+00, double* %42, align 8
  %indvars.iv.next141.5 = add nsw i64 %indvars.iv140, 6
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv151, i64 %indvars.iv.next141.5
  store double 0.000000e+00, double* %43, align 8
  %indvars.iv.next141.6 = add nsw i64 %indvars.iv140, 7
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv151, i64 %indvars.iv.next141.6
  store double 0.000000e+00, double* %44, align 8
  %indvars.iv.next141.7 = add nsw i64 %indvars.iv140, 8
  %exitcond143.7 = icmp eq i64 %indvars.iv.next141.7, %wide.trip.count142.7
  br i1 %exitcond143.7, label %._crit_edge61.loopexit, label %.lr.ph60.new

._crit_edge61.loopexit:                           ; preds = %.lr.ph60.new
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge61.loopexit, %.prol.loopexit145, %._crit_edge55
  %.lcssa17 = phi [2000 x double]* [ %.pre, %._crit_edge55 ], [ %32, %.prol.loopexit145 ], [ %32, %._crit_edge61.loopexit ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %.lcssa17, i64 %indvars.iv151, i64 %indvars.iv151
  store double 1.000000e+00, double* %45, align 8
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next152, %wide.trip.count153
  %indvars.iv.next160 = add nuw i64 %indvars.iv159, 1
  %indvars.iv.next162 = add i3 %indvars.iv161, -1
  br i1 %exitcond154, label %._crit_edge66, label %.lr.ph54

._crit_edge66:                                    ; preds = %._crit_edge61
  %46 = icmp sgt i32 %0, 0
  %47 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %48 = bitcast [2000 x [2000 x double]]** %4 to i8**
  store i8* %47, i8** %48, align 8
  br i1 %46, label %.preheader14.us.preheader, label %.preheader10._crit_edge

.preheader14.us.preheader:                        ; preds = %._crit_edge66
  %49 = add i32 %0, -1
  %50 = zext i32 %49 to i64
  %51 = shl nuw nsw i64 %50, 3
  %52 = add nuw nsw i64 %51, 8
  %xtraiter128 = and i32 %0, 3
  %lcmp.mod129 = icmp eq i32 %xtraiter128, 0
  br i1 %lcmp.mod129, label %.preheader14.us.prol.loopexit, label %._crit_edge47.us.prol.preheader

._crit_edge47.us.prol.preheader:                  ; preds = %.preheader14.us.preheader
  %53 = add nsw i32 %xtraiter128, -1
  %54 = zext i32 %53 to i64
  %55 = bitcast i8* %47 to [2000 x [2000 x double]]*
  br label %._crit_edge47.us.prol

._crit_edge47.us.prol:                            ; preds = %._crit_edge47.us.prol.preheader, %._crit_edge47.us.prol
  %indvars.iv124.prol = phi i64 [ %indvars.iv.next125.prol, %._crit_edge47.us.prol ], [ 0, %._crit_edge47.us.prol.preheader ]
  %prol.iter130 = phi i32 [ %prol.iter130.sub, %._crit_edge47.us.prol ], [ %xtraiter128, %._crit_edge47.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv124.prol, i64 0
  %scevgep123.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.prol, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next125.prol = add nuw nsw i64 %indvars.iv124.prol, 1
  %prol.iter130.sub = add nsw i32 %prol.iter130, -1
  %prol.iter130.cmp = icmp eq i32 %prol.iter130.sub, 0
  br i1 %prol.iter130.cmp, label %.preheader14.us.prol.loopexit.loopexit, label %._crit_edge47.us.prol, !llvm.loop !3

.preheader14.us.prol.loopexit.loopexit:           ; preds = %._crit_edge47.us.prol
  %56 = add nuw nsw i64 %54, 1
  br label %.preheader14.us.prol.loopexit

.preheader14.us.prol.loopexit:                    ; preds = %.preheader14.us.prol.loopexit.loopexit, %.preheader14.us.preheader
  %indvars.iv124.unr = phi i64 [ 0, %.preheader14.us.preheader ], [ %56, %.preheader14.us.prol.loopexit.loopexit ]
  %57 = icmp ult i32 %49, 3
  br i1 %57, label %.preheader12.us.preheader, label %._crit_edge47.us.3.preheader

._crit_edge47.us.3.preheader:                     ; preds = %.preheader14.us.prol.loopexit
  %wide.trip.count126.3 = zext i32 %0 to i64
  %58 = add nsw i64 %wide.trip.count126.3, -4
  %59 = sub nsw i64 %58, %indvars.iv124.unr
  %60 = lshr i64 %59, 2
  %61 = and i64 %60, 1
  %lcmp.mod = icmp eq i64 %61, 0
  br i1 %lcmp.mod, label %._crit_edge47.us.3.prol.preheader, label %._crit_edge47.us.3.prol.loopexit

._crit_edge47.us.3.prol.preheader:                ; preds = %._crit_edge47.us.3.preheader
  br label %._crit_edge47.us.3.prol

._crit_edge47.us.3.prol:                          ; preds = %._crit_edge47.us.3.prol.preheader
  %62 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %63 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %64 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %65 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %scevgep.prol165 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv124.unr, i64 0
  %scevgep123.prol166 = bitcast double* %scevgep.prol165 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.prol166, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next125.prol167 = add nuw nsw i64 %indvars.iv124.unr, 1
  %scevgep.1.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %64, i64 0, i64 %indvars.iv.next125.prol167, i64 0
  %scevgep123.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.1.prol, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next125.1.prol = add nsw i64 %indvars.iv124.unr, 2
  %scevgep.2.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv.next125.1.prol, i64 0
  %scevgep123.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.2.prol, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next125.2.prol = add nsw i64 %indvars.iv124.unr, 3
  %scevgep.3.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %62, i64 0, i64 %indvars.iv.next125.2.prol, i64 0
  %scevgep123.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.3.prol, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next125.3.prol = add nsw i64 %indvars.iv124.unr, 4
  br label %._crit_edge47.us.3.prol.loopexit

._crit_edge47.us.3.prol.loopexit:                 ; preds = %._crit_edge47.us.3.prol, %._crit_edge47.us.3.preheader
  %indvars.iv124.unr168 = phi i64 [ %indvars.iv124.unr, %._crit_edge47.us.3.preheader ], [ %indvars.iv.next125.3.prol, %._crit_edge47.us.3.prol ]
  %66 = icmp eq i64 %60, 0
  br i1 %66, label %.preheader13, label %._crit_edge47.us.3.preheader.new

._crit_edge47.us.3.preheader.new:                 ; preds = %._crit_edge47.us.3.prol.loopexit
  %67 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %68 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %69 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %70 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %71 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %72 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %73 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %74 = bitcast i8* %47 to [2000 x [2000 x double]]*
  br label %._crit_edge47.us.3

.preheader13.unr-lcssa:                           ; preds = %._crit_edge47.us.3
  br label %.preheader13

.preheader13:                                     ; preds = %._crit_edge47.us.3.prol.loopexit, %.preheader13.unr-lcssa
  %75 = icmp sgt i32 %0, 0
  br i1 %75, label %.preheader12.us.preheader, label %.preheader10._crit_edge

.preheader12.us.preheader:                        ; preds = %.preheader14.us.prol.loopexit, %.preheader13
  %76 = load [2000 x double]*, [2000 x double]** %3, align 8
  %77 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %4, align 8
  %xtraiter108 = and i32 %0, 1
  %wide.trip.count112 = zext i32 %0 to i64
  %wide.trip.count104.1 = zext i32 %0 to i64
  %wide.trip.count116 = zext i32 %0 to i64
  %78 = icmp eq i32 %xtraiter108, 0
  %79 = icmp eq i32 %0, 1
  %sunkaddr = ptrtoint [2000 x double]* %76 to i64
  br label %.preheader11.us.us.preheader

.preheader11.us.us.preheader:                     ; preds = %._crit_edge27.us, %.preheader12.us.preheader
  %indvars.iv114 = phi i64 [ 0, %.preheader12.us.preheader ], [ %indvars.iv.next115, %._crit_edge27.us ]
  %sunkaddr156 = shl i64 %indvars.iv114, 3
  %sunkaddr157 = add i64 %sunkaddr, %sunkaddr156
  %sunkaddr158 = inttoptr i64 %sunkaddr157 to double*
  br label %.preheader11.us.us

._crit_edge27.us:                                 ; preds = %._crit_edge25.us.us
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next115, %wide.trip.count116
  br i1 %exitcond117, label %.preheader10, label %.preheader11.us.us.preheader

.preheader11.us.us:                               ; preds = %._crit_edge25.us.us, %.preheader11.us.us.preheader
  %indvars.iv110 = phi i64 [ 0, %.preheader11.us.us.preheader ], [ %indvars.iv.next111, %._crit_edge25.us.us ]
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv110, i64 %indvars.iv114
  br i1 %78, label %.prol.loopexit107, label %81

; <label>:81:                                     ; preds = %.preheader11.us.us
  %82 = load double, double* %80, align 8
  %83 = load double, double* %sunkaddr158, align 8
  %84 = fmul double %82, %83
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv110, i64 0
  %86 = load double, double* %85, align 8
  %87 = fadd double %84, %86
  store double %87, double* %85, align 8
  br label %.prol.loopexit107

.prol.loopexit107:                                ; preds = %.preheader11.us.us, %81
  %indvars.iv102.unr.ph = phi i64 [ 1, %81 ], [ 0, %.preheader11.us.us ]
  br i1 %79, label %._crit_edge25.us.us, label %.preheader11.us.us.new.preheader

.preheader11.us.us.new.preheader:                 ; preds = %.prol.loopexit107
  br label %.preheader11.us.us.new

._crit_edge25.us.us.loopexit:                     ; preds = %.preheader11.us.us.new
  br label %._crit_edge25.us.us

._crit_edge25.us.us:                              ; preds = %._crit_edge25.us.us.loopexit, %.prol.loopexit107
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next111, %wide.trip.count112
  br i1 %exitcond113, label %._crit_edge27.us, label %.preheader11.us.us

.preheader11.us.us.new:                           ; preds = %.preheader11.us.us.new.preheader, %.preheader11.us.us.new
  %indvars.iv102 = phi i64 [ %indvars.iv.next103.1, %.preheader11.us.us.new ], [ %indvars.iv102.unr.ph, %.preheader11.us.us.new.preheader ]
  %88 = load double, double* %80, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv102, i64 %indvars.iv114
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv110, i64 %indvars.iv102
  %93 = load double, double* %92, align 8
  %94 = fadd double %91, %93
  store double %94, double* %92, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %95 = load double, double* %80, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv.next103, i64 %indvars.iv114
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv110, i64 %indvars.iv.next103
  %100 = load double, double* %99, align 8
  %101 = fadd double %98, %100
  store double %101, double* %99, align 8
  %indvars.iv.next103.1 = add nuw nsw i64 %indvars.iv102, 2
  %exitcond105.1 = icmp eq i64 %indvars.iv.next103.1, %wide.trip.count104.1
  br i1 %exitcond105.1, label %._crit_edge25.us.us.loopexit, label %.preheader11.us.us.new

.preheader10:                                     ; preds = %._crit_edge27.us
  %102 = icmp sgt i32 %0, 0
  br i1 %102, label %.preheader.us.preheader, label %.preheader10._crit_edge

.preheader10._crit_edge:                          ; preds = %._crit_edge66, %._crit_edge66.thread, %.preheader13, %.preheader10
  %103 = bitcast [2000 x [2000 x double]]** %4 to i8**
  %.pre88 = load i8*, i8** %103, align 8
  br label %138

.preheader.us.preheader:                          ; preds = %.preheader10
  %104 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %4, align 8
  %105 = load [2000 x double]*, [2000 x double]** %3, align 8
  %106 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %wide.trip.count99 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  %107 = add nsw i32 %xtraiter, -1
  %108 = zext i32 %107 to i64
  %109 = add nuw nsw i64 %108, 1
  %110 = icmp eq i32 %xtraiter, 0
  %111 = icmp ult i32 %106, 3
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv97 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next98, %._crit_edge.us ]
  br i1 %110, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv97, i64 %indvars.iv.prol
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %105, i64 %indvars.iv97, i64 %indvars.iv.prol
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !4

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %109, %.prol.loopexit.loopexit ]
  br i1 %111, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv97, i64 %indvars.iv
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %105, i64 %indvars.iv97, i64 %indvars.iv
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next
  %123 = bitcast double* %122 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %105, i64 %indvars.iv97, i64 %indvars.iv.next
  %126 = bitcast double* %125 to i64*
  store i64 %124, i64* %126, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.1
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %105, i64 %indvars.iv97, i64 %indvars.iv.next.1
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %132 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.2
  %133 = bitcast double* %132 to i64*
  %134 = load i64, i64* %133, align 8
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %105, i64 %indvars.iv97, i64 %indvars.iv.next.2
  %136 = bitcast double* %135 to i64*
  store i64 %134, i64* %136, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond = icmp eq i64 %indvars.iv.next98, %wide.trip.count99
  br i1 %exitcond, label %._crit_edge19, label %.preheader.us

._crit_edge19:                                    ; preds = %._crit_edge.us
  %137 = bitcast [2000 x [2000 x double]]* %104 to i8*
  br label %138

; <label>:138:                                    ; preds = %.preheader10._crit_edge, %._crit_edge19
  %139 = phi i8* [ %.pre88, %.preheader10._crit_edge ], [ %137, %._crit_edge19 ]
  tail call void @free(i8* %139) #4
  ret void

._crit_edge47.us.3:                               ; preds = %._crit_edge47.us.3, %._crit_edge47.us.3.preheader.new
  %indvars.iv124 = phi i64 [ %indvars.iv124.unr168, %._crit_edge47.us.3.preheader.new ], [ %indvars.iv.next125.3.1, %._crit_edge47.us.3 ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %70, i64 0, i64 %indvars.iv124, i64 0
  %scevgep123 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv.next125, i64 0
  %scevgep123.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.1, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next125.1 = add nsw i64 %indvars.iv124, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv.next125.1, i64 0
  %scevgep123.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.2, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next125.2 = add nsw i64 %indvars.iv124, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv.next125.2, i64 0
  %scevgep123.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.3, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next125.3 = add nsw i64 %indvars.iv124, 4
  %scevgep.1169 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv.next125.3, i64 0
  %scevgep123.1170 = bitcast double* %scevgep.1169 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.1170, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next125.1171 = add nsw i64 %indvars.iv124, 5
  %scevgep.1.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv.next125.1171, i64 0
  %scevgep123.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.1.1, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next125.1.1 = add nsw i64 %indvars.iv124, 6
  %scevgep.2.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %72, i64 0, i64 %indvars.iv.next125.1.1, i64 0
  %scevgep123.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.2.1, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next125.2.1 = add nsw i64 %indvars.iv124, 7
  %scevgep.3.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv.next125.2.1, i64 0
  %scevgep123.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.3.1, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next125.3.1 = add nsw i64 %indvars.iv124, 8
  %exitcond127.3.1 = icmp eq i64 %indvars.iv.next125.3.1, %wide.trip.count126.3
  br i1 %exitcond127.3.1, label %.preheader13.unr-lcssa, label %._crit_edge47.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader6.preheader, label %._crit_edge21

.preheader6.preheader:                            ; preds = %2
  %wide.trip.count76 = zext i32 %0 to i64
  %wide.trip.count70 = zext i32 %0 to i64
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.preheader, %._crit_edge16
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge16 ], [ 0, %.preheader6.preheader ]
  %4 = add nuw i64 %indvars.iv74, 4294967295
  %5 = icmp sgt i64 %indvars.iv74, 0
  br i1 %5, label %.preheader5.preheader, label %._crit_edge16

.preheader5.preheader:                            ; preds = %.preheader6
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 0
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.preheader, %._crit_edge
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge ], [ 0, %.preheader5.preheader ]
  %7 = add nuw i64 %indvars.iv46, 4294967295
  %8 = icmp sgt i64 %indvars.iv46, 0
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv46
  %.pre = load double, double* %9, align 8
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader5
  %xtraiter79 = and i64 %indvars.iv46, 1
  %lcmp.mod = icmp eq i64 %xtraiter79, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %10

; <label>:10:                                     ; preds = %.lr.ph
  %11 = load double, double* %6, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv46
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fsub double %.pre, %14
  store double %15, double* %9, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %10
  %indvars.iv.unr.ph = phi i64 [ 1, %10 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %15, %10 ], [ %.pre, %.lr.ph ]
  %.lcssa37.unr.ph = phi double [ %15, %10 ], [ undef, %.lr.ph ]
  %16 = trunc i64 %7 to i32
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %18 = phi double [ %30, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv46
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  store double %24, double* %9, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv.next
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv46
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %24, %29
  store double %30, double* %9, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv46
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader5, %.prol.loopexit
  %31 = phi double [ %.lcssa37.unr.ph, %.prol.loopexit ], [ %.pre, %.preheader5 ], [ %30, %._crit_edge.loopexit ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv46
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv46
  %35 = fdiv double %31, %33
  store double %35, double* %34, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, %indvars.iv74
  br i1 %exitcond, label %.preheader.lr.ph, label %.preheader5

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %36 = icmp sgt i64 %indvars.iv74, 0
  br i1 %36, label %.preheader.us.preheader, label %._crit_edge16

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter6178 = and i64 %indvars.iv74, 1
  %37 = trunc i64 %4 to i32
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 0
  %39 = icmp eq i64 %xtraiter6178, 0
  %40 = icmp eq i32 %37, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge13.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge13.us ], [ %indvars.iv74, %.preheader.us.preheader ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv66
  %.pre36 = load double, double* %41, align 8
  br i1 %39, label %.prol.loopexit60, label %42

; <label>:42:                                     ; preds = %.preheader.us
  %43 = load double, double* %38, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv66
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %.pre36, %46
  store double %47, double* %41, align 8
  br label %.prol.loopexit60

.prol.loopexit60:                                 ; preds = %.preheader.us, %42
  %indvars.iv52.unr.ph = phi i64 [ 1, %42 ], [ 0, %.preheader.us ]
  %.unr63.ph = phi double [ %47, %42 ], [ %.pre36, %.preheader.us ]
  br i1 %40, label %._crit_edge13.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit60
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.1, %.preheader.us.new ], [ %indvars.iv52.unr.ph, %.preheader.us.new.preheader ]
  %48 = phi double [ %60, %.preheader.us.new ], [ %.unr63.ph, %.preheader.us.new.preheader ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv52
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv66
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fsub double %48, %53
  store double %54, double* %41, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv.next53
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv66
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fsub double %54, %59
  store double %60, double* %41, align 8
  %indvars.iv.next53.1 = add nuw nsw i64 %indvars.iv52, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next53.1, %indvars.iv74
  br i1 %exitcond58.1, label %._crit_edge13.us.loopexit, label %.preheader.us.new

._crit_edge13.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit, %.prol.loopexit60
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next67, %wide.trip.count70
  br i1 %exitcond71, label %._crit_edge16.loopexit, label %.preheader.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader6, %.preheader.lr.ph
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count76
  br i1 %exitcond77, label %._crit_edge21.loopexit, label %.preheader6

._crit_edge21.loopexit:                           ; preds = %._crit_edge16
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge3

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count11 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next10, %._crit_edge.us ]
  %9 = mul nsw i64 %8, %indvars.iv9
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  br i1 %exitcond12, label %._crit_edge3.loopexit, label %.preheader.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
